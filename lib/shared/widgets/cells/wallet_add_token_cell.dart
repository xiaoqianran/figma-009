import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/other/wallet_coin_icon.dart';
import 'package:flutter/material.dart';

class AddTokenItem {
  const AddTokenItem({
    required this.name,
    required this.symbol,
    required this.iconAsset,
  });

  final String name;
  final String symbol;
  final String iconAsset;
}

/// Figma Add Token list row.
class WalletAddTokenCell extends StatelessWidget {
  const WalletAddTokenCell({
    required this.token,
    required this.onTap,
    super.key,
  });

  final AddTokenItem token;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final nameStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final symbolStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 14, color: AppColors.gray);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: DesignConstants.spacing12,
        ),
        child: Row(
          children: [
            WalletCoinIcon(asset: token.iconAsset),
            const SizedBox(width: DesignConstants.spacing16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(token.name, style: nameStyle),
                  const SizedBox(height: DesignConstants.spacing4),
                  Text(token.symbol, style: symbolStyle),
                ],
              ),
            ),
            const Icon(
              Icons.add_circle_outline,
              color: AppColors.white,
              size: DesignConstants.iconSize24,
            ),
          ],
        ),
      ),
    );
  }
}
