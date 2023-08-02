import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:melt/beat_maker/view/bloc/beat_maker_bloc.dart';
import 'package:melt/beat_maker/view/widget/beat_row.dart';
import 'package:melt/shared/extensions/duration.dart';
import 'package:melt/shared/extensions/int.dart';
import 'package:melt/shared/theme/app_theme.dart';
import 'package:melt/shared/widgets/melt_appbar.dart';
import 'package:melt/shared/widgets/play_button.dart';

class BeatMakerScreen extends StatelessWidget {
  const BeatMakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BeatMakerBloc(),
      child: const _BeatMakerScreenInternal(),
    );
  }
}

class _BeatMakerScreenInternal extends StatefulWidget {
  const _BeatMakerScreenInternal();

  @override
  State<_BeatMakerScreenInternal> createState() =>
      _BeatMakerScreenInternalState();
}

class _BeatMakerScreenInternalState extends State<_BeatMakerScreenInternal> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
    ]);
    context.read<BeatMakerBloc>().add(BeatMakerPlayeSetupRequested());
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  void _startLoop({int? tick}) {
    int counter = tick ?? 0;
    final bpm = context.read<BeatMakerBloc>().state.bpm;
    final sixteenthNote = bpm.durationOfBeat().fraction(4);
    _timer ??= Timer.periodic(sixteenthNote, (timer) {
      context
          .read<BeatMakerBloc>()
          .add(BeatMakerPlayTickRequested(tick: counter));
      counter++;
      if (counter > 15) counter = 0;
    });
  }

  void _stopPlaying() {
    _timer?.cancel();
    _timer = null;
  }

  void _stopTick() {
    context.read<BeatMakerBloc>().add(BeatMakerPlayerStopRequested());
  }

  void _startTick() {
    context.read<BeatMakerBloc>().add(BeatMakerPlayerStartRequested());
  }

  void _toggleBeat(int beat) {
    context.read<BeatMakerBloc>().add(BeatMakerToggleBeatRequested(beat: beat));
  }

  void _addBpm() {
    context.read<BeatMakerBloc>().add(BeatMakerMetronomeUpRequested());
  }

  void _subtractBpm() {
    context.read<BeatMakerBloc>().add(BeatMakerMetronomeDownRequested());
  }

  void _updateBPMTicking(int tick) {
    _stopPlaying();
    _startLoop(tick: tick++);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeltAppBar.horizontal(),
      extendBodyBehindAppBar: true,
      body: BlocListener<BeatMakerBloc, BeatMakerState>(
        listener: (context, state) {
          if (state is BeatMakerPlay) {
            _startLoop();
          }
          if (state is BeatMakerStop) {
            _stopPlaying();
          }
          if (state is BeatMakerBPMUpdated && state.isPlaying) {
            _updateBPMTicking(state.tick);
          }
        },
        child: BlocBuilder<BeatMakerBloc, BeatMakerState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return SafeArea(
              left: false,
              top: false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: kToolbarHeight,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          PlayButton(
                            isPlaying: state.isPlaying,
                            onPlay: state.isPlaying ? _stopTick : _startTick,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Icon(CupertinoIcons.metronome),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8),
                            ),
                            onPressed: _subtractBpm,
                            child: const Icon(CupertinoIcons.minus),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Text(
                              state.bpm.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .brandYellow,
                                  ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8),
                            ),
                            onPressed: _addBpm,
                            child: const Icon(CupertinoIcons.add),
                          ),
                        ],
                      ),
                      BeatRow(
                        label: 'Open hat',
                        stepCounter: state.tick,
                        row: 100,
                        selectedChips: state.selectedBeats,
                        onToggleBeat: _toggleBeat,
                        isPlaying: state.isPlaying,
                      ),
                      BeatRow(
                        label: 'Closed hat',
                        stepCounter: state.tick,
                        row: 200,
                        selectedChips: state.selectedBeats,
                        onToggleBeat: _toggleBeat,
                        isPlaying: state.isPlaying,
                      ),
                      BeatRow(
                        label: 'Snare',
                        stepCounter: state.tick,
                        row: 300,
                        selectedChips: state.selectedBeats,
                        onToggleBeat: _toggleBeat,
                        isPlaying: state.isPlaying,
                      ),
                      BeatRow(
                        label: 'Kick',
                        stepCounter: state.tick,
                        row: 400,
                        selectedChips: state.selectedBeats,
                        onToggleBeat: _toggleBeat,
                        isPlaying: state.isPlaying,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
