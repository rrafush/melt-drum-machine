part of 'beat_maker_bloc.dart';

@immutable
abstract class BeatMakerEvent extends Equatable {
  const BeatMakerEvent();
  @override
  List<Object?> get props => [];
}

class BeatMakerPlayeSetupRequested extends BeatMakerEvent {}

class BeatMakerPlayerStartRequested extends BeatMakerEvent {}

class BeatMakerPlayerStopRequested extends BeatMakerEvent {}

class BeatMakerPlayTickRequested extends BeatMakerEvent {
  const BeatMakerPlayTickRequested({
    required this.tick,
  });

  final int tick;

  @override
  List<Object?> get props => [
        tick,
      ];
}

class BeatMakerMetronomeUpRequested extends BeatMakerEvent {}

class BeatMakerMetronomeDownRequested extends BeatMakerEvent {}

class BeatMakerToggleBeatRequested extends BeatMakerEvent {
  const BeatMakerToggleBeatRequested({
    required this.beat,
  });

  final int beat;

  @override
  List<Object?> get props => [
        beat,
      ];
}
