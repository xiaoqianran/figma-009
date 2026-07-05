import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Other / Title` — display title with gradient underline accent.
class WalletSectionTitle extends StatelessWidget {
  const WalletSectionTitle({
    required this.title,
    super.key,
    this.textAlign = TextAlign.left,
    this.underlineWidth,
  });

  final String title;
  final TextAlign textAlign;
  final double? underlineWidth;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
      height: 1.2,
    );

    return Column(
      crossAxisAlignment: textAlign == TextAlign.center
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(title, style: titleStyle, textAlign: textAlign),
        const SizedBox(height: DesignConstants.spacing8),
        Container(
          width: underlineWidth ?? 140,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppColors.titleGradient,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}
