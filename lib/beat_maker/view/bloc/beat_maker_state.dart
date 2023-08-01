part of 'beat_maker_bloc.dart';

@immutable
abstract class BeatMakerState {
  const BeatMakerState({
    this.bpm = 90,
    this.selectedBeats = const [],
    this.tick = 0,
    this.isPlaying = false,
  });

  final int bpm;
  final List<int> selectedBeats;
  final int tick;
  final bool isPlaying;
}

class BeatMakerInitial extends BeatMakerState {
  const BeatMakerInitial({
    super.bpm,
    super.selectedBeats,
    super.tick,
    super.isPlaying,
  });
}

class BeatMakerSetupSuccessfull extends BeatMakerState {
  const BeatMakerSetupSuccessfull({
    super.bpm,
    super.selectedBeats,
    super.tick,
    super.isPlaying,
  });
}

class BeatMakerPlay extends BeatMakerState {
  const BeatMakerPlay({
    super.bpm,
    super.selectedBeats,
    super.tick,
    super.isPlaying,
  });
}

class BeatMakerStop extends BeatMakerState {
  const BeatMakerStop({
    super.bpm,
    super.selectedBeats,
    super.tick,
    super.isPlaying,
  });
}

class BeatMakerPlayTick extends BeatMakerState {
  const BeatMakerPlayTick({
    super.bpm,
    super.selectedBeats,
    super.tick,
    super.isPlaying,
  });
}

class BeatMakerBPMUpdated extends BeatMakerState {
  const BeatMakerBPMUpdated({
    super.bpm,
    super.selectedBeats,
    super.tick,
    super.isPlaying,
  });
}

class BeatMakerBeatUpdated extends BeatMakerState {
  const BeatMakerBeatUpdated({
    super.bpm,
    super.selectedBeats,
    super.tick,
    super.isPlaying,
  });
}
