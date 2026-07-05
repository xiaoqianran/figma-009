import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Settings-style menu row with optional subtitle and chevron.
class WalletListMenuCell extends StatelessWidget {
  const WalletListMenuCell({
    required this.title,
    required this.onTap,
    super.key,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final subtitleStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 14, color: AppColors.gray);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: DesignConstants.spacing16,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: titleStyle),
                  if (subtitle != null) ...[
                    const SizedBox(height: DesignConstants.spacing4),
                    Text(subtitle!, style: subtitleStyle),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: AppColors.gray,
              size: DesignConstants.iconSize24,
            ),
          ],
        ),
      ),
    );
  }
}
