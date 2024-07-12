import 'package:flutter/material.dart';
import 'package:melt/piano/controller/controller.dart';
import 'package:melt/piano/view/octave/black_keys.dart';
import 'package:melt/piano/view/octave/white_keys.dart';

class Octave extends StatelessWidget {
  const Octave({
    super.key,
    required this.octave,
    required this.controller,
  });

  final int octave;
  final Controller controller;
  get octaveStartingNote => (octave * 12) % 128;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WhiteKeys(
          firstNoteOctave: octaveStartingNote,
          contoller: controller,
        ),
        BlackKeys(
          firstNoteOctave: octaveStartingNote,
          controller: controller,
        ),
      ],
    );
  }
}
