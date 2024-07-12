import 'package:flutter/material.dart';
import 'package:melt/piano/controller/controller.dart';
import 'package:melt/piano/view/widgets/key/piano_key.dart';

class WhiteKeys extends StatelessWidget {
  const WhiteKeys({
    super.key,
    required this.firstNoteOctave,
    required this.contoller,
  });

  final int firstNoteOctave;
  final Controller contoller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        PianoKey.white(
          note: firstNoteOctave,
          controller: contoller,
        ),
        PianoKey.white(
          note: firstNoteOctave + 2,
          controller: contoller,
        ),
        PianoKey.white(
          note: firstNoteOctave + 4,
          controller: contoller,
        ),
        PianoKey.white(
          note: firstNoteOctave + 5,
          controller: contoller,
        ),
        PianoKey.white(
          note: firstNoteOctave + 7,
          controller: contoller,
        ),
        PianoKey.white(
          note: firstNoteOctave + 9,
          controller: contoller,
        ),
        PianoKey.white(
          note: firstNoteOctave + 11,
          controller: contoller,
        ),
      ],
    );
  }
}
