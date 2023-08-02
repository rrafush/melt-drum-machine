import 'package:flutter/material.dart';
import 'package:melt/shared/theme/app_colors.dart';

enum _BeatChipType {
  selected(
    borderColor: AppColors.brandBlue,
    innerColor: AppColors.brandYellow,
  ),
  playing(
    borderColor: AppColors.brandBeige,
    innerColor: Colors.transparent,
  ),
  selectedAndPlaying(
    borderColor: AppColors.brandBeige,
    innerColor: AppColors.brandYellow,
  ),
  defaultState(
    borderColor: AppColors.brandBlue,
    innerColor: Colors.transparent,
  );

  const _BeatChipType({
    required this.borderColor,
    required this.innerColor,
  });

  final Color borderColor;
  final Color innerColor;
}

class BeatChip extends StatelessWidget {
  const BeatChip({
    super.key,
    this.isSelected = false,
    this.isPlaying = false,
    required this.onTap,
  });

  final bool isSelected;
  final bool isPlaying;
  final VoidCallback onTap;

  bool get selectedAndPlaying => isSelected && isPlaying;

  _BeatChipType get state {
    if (selectedAndPlaying) return _BeatChipType.selectedAndPlaying;
    if (isSelected) return _BeatChipType.selected;
    if (isPlaying) return _BeatChipType.playing;
    return _BeatChipType.defaultState;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.only(
          left: 2,
          right: 2,
          top: 2,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: state.borderColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: 20,
          margin: const EdgeInsets.all(4),
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: state.innerColor,
            border: Border.all(
              color: state.borderColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
