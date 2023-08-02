import 'package:flutter/material.dart';
import 'package:melt/piano/view/widgets/key/piano_key.dart';

class BlackKeys extends StatelessWidget {
  final int firstNoteOctave;

  const BlackKeys({
    required this.firstNoteOctave,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          PianoKey.black(
            note: firstNoteOctave + 1,
          ),
          PianoKey.black(
            note: firstNoteOctave + 3,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: PianoKey.black(
              note: firstNoteOctave + 6,
            ),
          ),
          PianoKey.black(
            note: firstNoteOctave + 8,
          ),
          PianoKey.black(
            note: firstNoteOctave + 10,
          )
        ],
      ),
    );
  }
}
