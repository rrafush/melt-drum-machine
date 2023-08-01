import 'package:flutter/material.dart';
import 'package:piano/piano/view/widgets/key/piano_key.dart';

class WhiteKeys extends StatelessWidget {
  final int firstNoteOctave;

  const WhiteKeys({
    required this.firstNoteOctave,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PianoKey.white(
          note: firstNoteOctave,
        ),
        PianoKey.white(
          note: firstNoteOctave + 2,
        ),
        PianoKey.white(
          note: firstNoteOctave + 4,
        ),
        PianoKey.white(
          note: firstNoteOctave + 5,
        ),
        PianoKey.white(
          note: firstNoteOctave + 7,
        ),
        PianoKey.white(
          note: firstNoteOctave + 9,
        ),
        PianoKey.white(
          note: firstNoteOctave + 11,
        ),
      ],
    );
  }
}
