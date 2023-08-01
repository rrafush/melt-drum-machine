import 'package:flutter/material.dart';
import 'package:piano/piano/controller/controller.dart';
import 'package:piano/piano/model/key.dart';
import 'package:piano/shared/theme/app_colors.dart';

class PianoKey extends StatefulWidget {
  final int note;
  final KeyColor keyColor;

  const PianoKey.black({
    required this.note,
    super.key,
  }) : keyColor = KeyColor.black;

  const PianoKey.white({
    required this.note,
    super.key,
  }) : keyColor = KeyColor.white;

  @override
  State<PianoKey> createState() => _PianoKeyState();
}

class _PianoKeyState extends State<PianoKey> {
  final Controller _controller = Controller();

  void _playNote() => setState(() {
        _controller.playNote(widget.note);
      });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin: widget.keyColor.margin,
        child: InkWell(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          onTap: _playNote,
          child: Ink(
            width: widget.keyColor.width,
            height: widget.keyColor == KeyColor.white
                ? MediaQuery.of(context).size.height
                : MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: widget.keyColor.color,
              border: Border.all(color: AppColors.grey, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
