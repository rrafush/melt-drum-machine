import 'package:flutter/material.dart';
import 'package:piano/shared/theme/app_colors.dart';

class ElevatedCard extends StatelessWidget {
  const ElevatedCard({
    super.key,
    this.onTap,
    this.padding,
    this.color,
    this.margin,
    required this.child,
  });

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Widget child;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: margin ?? const EdgeInsets.all(16),
        child: Ink(
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.greyDark3,
                offset: Offset(1, 1),
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: padding ?? const EdgeInsets.all(8),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
