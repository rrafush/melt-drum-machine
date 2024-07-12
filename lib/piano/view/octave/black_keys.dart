import 'package:flutter/material.dart';
import 'package:melt/piano/controller/controller.dart';
import 'package:melt/piano/view/widgets/key/piano_key.dart';

class BlackKeys extends StatelessWidget {
  const BlackKeys({
    super.key,
    required this.controller,
    required this.firstNoteOctave,
  });

  final Controller controller;
  final int firstNoteOctave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          PianoKey.black(
            note: firstNoteOctave + 1,
            controller: controller,
          ),
          PianoKey.black(
            note: firstNoteOctave + 3,
            controller: controller,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: PianoKey.black(
              note: firstNoteOctave + 6,
              controller: controller,
            ),
          ),
          PianoKey.black(
            note: firstNoteOctave + 8,
            controller: controller,
          ),
          PianoKey.black(
            note: firstNoteOctave + 10,
            controller: controller,
          )
        ],
      ),
    );
  }
}
