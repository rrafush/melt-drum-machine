import 'package:flutter/material.dart';
import 'package:melt/piano/controller/controller.dart';
import 'package:melt/piano/model/key.dart';
import 'package:melt/shared/theme/app_colors.dart';

class PianoKey extends StatefulWidget {
  final int note;
  final KeyColor keyColor;
  final Controller controller;

  const PianoKey.black({
    required this.note,
    required this.controller,
    super.key,
  }) : keyColor = KeyColor.black;

  const PianoKey.white({
    required this.note,
    required this.controller,
    super.key,
  }) : keyColor = KeyColor.white;

  @override
  State<PianoKey> createState() => _PianoKeyState();
}

class _PianoKeyState extends State<PianoKey> {
  void _playNote() => setState(() {
        widget.controller.playNote(widget.note);
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
