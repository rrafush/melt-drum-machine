import 'package:piano/shared/plugins_wrappers/midi_player_wrapper.dart';

class BeatMakerController {
  final _wrapper = MidiPlayerWrapper(asset: 'assets/drums.sf2');
  int bpm = 90;
  int tick = 0;
  bool isPlaying = false;
  List<int> selectedBeats = [];
  int hatOpen = 42;
  int hatClosed = 44;
  int snare = 7;
  int kick = 12;

  bool shouldPlay(int note) => selectedBeats.contains(note);

  Future<void> setupMidiPlugin() async {
    await _wrapper.setupMidiPlayer();
  }

  void play(int tick) {
    final isStrong = tick % 4 == 0;

    if (shouldPlay(100 + tick)) {
      _wrapper.play(hatOpen, velocity: isStrong ? 80 : 60);
    }
    if (shouldPlay(200 + tick)) {
      _wrapper.play(hatClosed, velocity: isStrong ? 60 : 40);
    }
    if (shouldPlay(300 + tick)) {
      _wrapper.play(snare, velocity: isStrong ? 70 : 60);
    }
    if (shouldPlay(400 + tick)) {
      _wrapper.play(kick, velocity: isStrong ? 100 : 80);
    }
  }
}
