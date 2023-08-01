import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:piano/beat_maker/controller/beat_maker_controller.dart';

part 'beat_maker_event.dart';
part 'beat_maker_state.dart';

class BeatMakerBloc extends Bloc<BeatMakerEvent, BeatMakerState> {
  BeatMakerBloc() : super(const BeatMakerInitial()) {
    on<BeatMakerPlayeSetupRequested>(_mapBeatMakerPlayeSetupRequested);
    on<BeatMakerPlayerStartRequested>(_mapBeatMakerPlayerStartRequested);
    on<BeatMakerPlayerStopRequested>(_mapBeatMakerPlayerStopRequested);
    on<BeatMakerMetronomeUpRequested>(_mapBeatMakerMetronomeUpRequested);
    on<BeatMakerMetronomeDownRequested>(_mapBeatMakerMetronomeDownRequested);
    on<BeatMakerToggleBeatRequested>(_mapBeatToggleBeatRequested);
    on<BeatMakerPlayTickRequested>(_mapBeatMakerPlayTickRequested);
  }

  final _controller = BeatMakerController();

  Future<void> _mapBeatMakerPlayeSetupRequested(
      BeatMakerPlayeSetupRequested event, Emitter emit) async {
    _controller.setupMidiPlugin();
    emit(
      BeatMakerSetupSuccessfull(
        bpm: _controller.bpm,
        selectedBeats: _controller.selectedBeats,
        isPlaying: _controller.isPlaying,
      ),
    );
  }

  Future<void> _mapBeatMakerPlayerStartRequested(
      BeatMakerPlayerStartRequested event, Emitter emit) async {
    _controller.isPlaying = true;
    emit(
      BeatMakerPlay(
        bpm: _controller.bpm,
        selectedBeats: _controller.selectedBeats,
        isPlaying: _controller.isPlaying,
      ),
    );
  }

  Future<void> _mapBeatMakerPlayerStopRequested(
      BeatMakerPlayerStopRequested event, Emitter emit) async {
    _controller.isPlaying = false;
    emit(
      BeatMakerStop(
        bpm: _controller.bpm,
        selectedBeats: _controller.selectedBeats,
        isPlaying: _controller.isPlaying,
      ),
    );
  }

  Future<void> _mapBeatMakerMetronomeUpRequested(
      BeatMakerMetronomeUpRequested event, Emitter emit) async {
    _controller.bpm++;
    emit(
      BeatMakerBPMUpdated(
        isPlaying: _controller.isPlaying,
        selectedBeats: _controller.selectedBeats,
        bpm: _controller.bpm,
        tick: _controller.tick,
      ),
    );
  }

  Future<void> _mapBeatMakerMetronomeDownRequested(
      BeatMakerMetronomeDownRequested event, Emitter emit) async {
    if (_controller.bpm == 0) return;
    _controller.bpm--;
    emit(
      BeatMakerBPMUpdated(
        isPlaying: _controller.isPlaying,
        selectedBeats: _controller.selectedBeats,
        bpm: _controller.bpm,
        tick: _controller.tick,
      ),
    );
  }

  Future<void> _mapBeatToggleBeatRequested(
      BeatMakerToggleBeatRequested event, Emitter emit) async {
    if (_controller.selectedBeats.contains(event.beat)) {
      _controller.selectedBeats.remove(event.beat);
    } else {
      _controller.selectedBeats.add(event.beat);
    }
    emit(
      BeatMakerBeatUpdated(
        tick: _controller.tick,
        selectedBeats: _controller.selectedBeats,
        isPlaying: _controller.isPlaying,
        bpm: _controller.bpm,
      ),
    );
  }

  Future<void> _mapBeatMakerPlayTickRequested(
      BeatMakerPlayTickRequested event, Emitter emit) async {
    _controller.tick = event.tick;
    _controller.play(event.tick);
    emit(
      BeatMakerPlayTick(
        tick: event.tick,
        isPlaying: _controller.isPlaying,
        selectedBeats: _controller.selectedBeats,
        bpm: _controller.bpm,
      ),
    );
  }
}
