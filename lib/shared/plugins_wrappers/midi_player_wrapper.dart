import 'package:flutter_midi_pro/flutter_midi_pro.dart';

class MidiPlayerWrapper {
  MidiPlayerWrapper({
    required this.asset,
  });

  final String asset;
  final _midiPlayer = MidiPro();

  Future<void> setupMidiPlayer() async {
    await _midiPlayer.loadSoundfont(
      sf2Path: asset,
      name: asset.replaceAll('assets/', ''),
    );
  }

  Future<void> play(int note, {int? velocity}) async {
    await _midiPlayer.playMidiNote(midi: note, velocity: velocity ?? 100);
  }
}
