import 'package:flutter/material.dart';
import 'package:piano/beat_maker/view/widget/beat_chip.dart';
import 'package:piano/shared/theme/app_theme.dart';
import 'package:piano/shared/widgets/elevated_card.dart';

class BeatRow extends StatelessWidget {
  const BeatRow({
    super.key,
    required this.label,
    required this.stepCounter,
    required this.row,
    required this.onToggleBeat,
    required this.selectedChips,
    required this.isPlaying,
  });

  final String label;
  final int stepCounter;
  final int row;
  final Function(int beat) onToggleBeat;
  final List<int> selectedChips;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 115,
          child: ElevatedCard(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
            onTap: () {},
          ),
        ),
        ...List.generate(
          16,
          (index) {
            if (index % 4 == 0 && index != 0) {
              return Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.only(left: 8),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .brandBeige
                          .withOpacity(0.3),
                    ),
                  ),
                ),
                child: BeatChip(
                  isPlaying: stepCounter == index && isPlaying,
                  onTap: () => onToggleBeat(row + index),
                  isSelected: selectedChips.contains(row + index),
                ),
              );
            }
            return BeatChip(
              isPlaying: stepCounter == index && isPlaying,
              onTap: () => onToggleBeat(row + index),
              isSelected: selectedChips.contains(row + index),
            );
          },
        ),
      ],
    );
  }
}
