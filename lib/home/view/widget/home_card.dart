import 'package:flutter/material.dart';
import 'package:piano/shared/theme/app_colors.dart';
import 'package:piano/shared/theme/app_theme.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.assetImage,
    required this.onTap,
    required this.title,
    required this.isCurrent,
  });

  final String assetImage;
  final VoidCallback onTap;
  final String title;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyDark3,
                offset: isCurrent ? Offset(1, 1) : Offset(5, 5),
                blurStyle: BlurStyle.solid,
              ),
            ],
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    assetImage,
                    width: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.brandBeige,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
