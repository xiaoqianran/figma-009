import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Other / Seed Phrase` — numbered mnemonic word chip.
class SeedPhraseChip extends StatelessWidget {
  const SeedPhraseChip({required this.index, required this.word, super.key});

  final int index;
  final String word;

  @override
  Widget build(BuildContext context) {
    final indexStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.gray,
    );
    final wordStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );

    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(
        horizontal: DesignConstants.spacing16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DesignConstants.cornerRadiusSm),
        border: Border.all(color: AppColors.strokeDark),
      ),
      child: Row(
        children: [
          Text('$index. ', style: indexStyle),
          Text(word, style: wordStyle),
        ],
      ),
    );
  }
}
