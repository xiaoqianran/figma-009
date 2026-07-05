import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/other/wallet_asset_icon.dart';
import 'package:figma_009/shared/widgets/other/wallet_coin_icon.dart';
import 'package:flutter/material.dart';

/// Settings-style menu row with optional leading icon, subtitle and chevron.
class WalletListMenuCell extends StatelessWidget {
  const WalletListMenuCell({
    required this.title,
    required this.onTap,
    super.key,
    this.subtitle,
    this.iconAsset,
    this.trailing,
  });

  final String title;
  final String? subtitle;
  final String? iconAsset;
  final Widget? trailing;
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
            if (iconAsset != null) ...[
              WalletCoinIcon(asset: iconAsset!),
              const SizedBox(width: DesignConstants.spacing16),
            ],
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
            trailing ??
                const WalletAssetIcon(
                  WalletAssets.iconArrow,
                  size: DesignConstants.iconSize24,
                  color: AppColors.gray,
                ),
          ],
        ),
      ),
    );
  }
}
