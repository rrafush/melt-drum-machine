import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
    this.isPlaying = false,
    required this.onPlay,
  });

  final bool isPlaying;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPlay,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(
            color: isPlaying ? Colors.white : Colors.white.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          Icons.play_arrow_outlined,
          color: isPlaying ? Colors.white : Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
