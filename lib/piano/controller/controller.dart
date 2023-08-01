import 'package:piano/shared/plugins_wrappers/midi_player_wrapper.dart';

class Controller {
  final _wrapper = MidiPlayerWrapper(asset: 'assets/piano.sf2');

  Future<void> setupMidiPlugin() async {
    await _wrapper.setupMidiPlayer();
  }

  void playNote(int note) => _wrapper.play(note);

  void dispose() {}
}
