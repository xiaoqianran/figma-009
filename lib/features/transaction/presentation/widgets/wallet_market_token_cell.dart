import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:figma_009/shared/widgets/other/wallet_coin_icon.dart';
import 'package:figma_009/shared/widgets/other/wallet_trend_icon.dart';
import 'package:flutter/material.dart';

/// Figma Buy list cell — ticker symbol on the second row instead of balance.
class WalletMarketTokenCell extends StatelessWidget {
  const WalletMarketTokenCell({
    required this.token,
    required this.onTap,
    super.key,
  });

  final WalletToken token;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final nameStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 14, color: AppColors.gray);
    final tickerStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final changeStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.gray,
    );

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: DesignConstants.spacing8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WalletCoinIcon(asset: token.iconAsset),
                const SizedBox(width: DesignConstants.spacing12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(token.name, style: nameStyle),
                          const Spacer(),
                          Text(token.fiatValue, style: tickerStyle),
                        ],
                      ),
                      const SizedBox(height: DesignConstants.spacing4),
                      Row(
                        children: [
                          Text(token.symbol, style: tickerStyle),
                          const Spacer(),
                          Text(token.changePercent, style: changeStyle),
                          const SizedBox(width: DesignConstants.spacing8),
                          WalletTrendIcon(isUp: token.isUp),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: DesignConstants.spacing8),
            const Divider(height: 1, color: Color(0xFF1E1E1E)),
          ],
        ),
      ),
    );
  }
}
