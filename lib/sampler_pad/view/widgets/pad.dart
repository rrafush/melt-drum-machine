import 'dart:async';

import 'package:flutter/material.dart';
import 'package:melt/sampler_pad/controller/controller.dart';
import 'package:melt/shared/theme/app_colors.dart';

class Pad extends StatefulWidget {
  final int index;

  const Pad({
    super.key,
    required this.index,
  });

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  final Controller _controller = Controller();
  final _tapNotifier = ValueNotifier<bool>(false);

  Future<void> _play() async {
    _tapNotifier.value = true;
    final note = widget.index;
    _controller.playNote(note);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) => _play(),
      onPointerUp: (event) => _tapNotifier.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: _tapNotifier,
        builder: (context, value, _) => Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyDark3),
            borderRadius: BorderRadius.circular(5),
            gradient: RadialGradient(
              colors: [
                AppColors.brandPink.withOpacity(value ? 1 : 0.4),
                AppColors.brandOrange.withOpacity(value ? 1 : 0.4),
              ],
              center: Alignment.center,
              focalRadius: 0,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 0,
                color: AppColors.greyDark3,
                offset: Offset(4, 4),
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
