import 'package:flutter/material.dart';
import 'package:piano/piano/view/octave/black_keys.dart';
import 'package:piano/piano/view/octave/white_keys.dart';

class Octave extends StatelessWidget {
  final int octave;
  get octaveStartingNote => (octave * 12) % 128;

  const Octave({
    required this.octave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WhiteKeys(
          firstNoteOctave: octaveStartingNote,
        ),
        BlackKeys(
          firstNoteOctave: octaveStartingNote,
        ),
      ],
    );
  }
}
