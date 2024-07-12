import 'package:flutter_midi_pro/flutter_midi_pro.dart';

class MidiPlayerWrapper {
  MidiPlayerWrapper({
    required this.asset,
  });

  final String asset;
  final _midiPlayer = MidiPro();
  List<int> playedNotes = List.empty(growable: true);

  Future<void> setupMidiPlayer() async {
    await _midiPlayer.loadSoundfont(
      sf2Path: asset,
      name: asset.replaceAll('assets/', ''),
    );
  }

  Future<void> play(int note, {int? velocity}) async {
    await _midiPlayer.playMidiNote(midi: note, velocity: velocity ?? 100);
    if (!playedNotes.contains(note)) playedNotes.add(note);
  }

  void dispose() {
    for (final note in playedNotes) {
      _midiPlayer.stopMidiNote(midi: note);
    }
    playedNotes.clear();
  }
}
