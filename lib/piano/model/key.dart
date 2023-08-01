import 'package:flutter/material.dart';
import 'package:piano/shared/constants.dart';
import 'package:piano/shared/theme/app_colors.dart';

enum KeyColor {
  white(
    color: AppColors.white,
    width: Constants.kWhiteKeyWidth,
  ),
  black(
    margin: EdgeInsets.only(left: 40),
    color: AppColors.black,
    width: Constants.kBlackKeyWidth,
  );

  const KeyColor({
    this.margin,
    required this.color,
    required this.width,
  });

  final EdgeInsetsGeometry? margin;
  final Color color;
  final double width;
}
