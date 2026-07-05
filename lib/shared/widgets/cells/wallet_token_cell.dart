import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:flutter/material.dart';

/// Figma `Cell / Default / Up|Down` — token list row.
class WalletTokenCell extends StatelessWidget {
  const WalletTokenCell({required this.token, required this.onTap, super.key});

  final WalletToken token;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final nameStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 14, color: AppColors.gray);
    final amountStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
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
                _CoinIcon(color: token.iconColor, symbol: token.symbol),
                const SizedBox(width: DesignConstants.spacing12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(token.name, style: nameStyle),
                          const Spacer(),
                          Text(token.fiatValue, style: amountStyle),
                        ],
                      ),
                      const SizedBox(height: DesignConstants.spacing4),
                      Row(
                        children: [
                          Text(token.amount, style: amountStyle),
                          const Spacer(),
                          Text(token.changePercent, style: changeStyle),
                          const SizedBox(width: DesignConstants.spacing8),
                          Icon(
                            token.isUp ? Icons.north_east : Icons.south_east,
                            size: DesignConstants.iconSize24,
                            color: token.isUp
                                ? AppColors.titleGradient.colors.first
                                : AppColors.pinkGradient.colors.last,
                          ),
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

class _CoinIcon extends StatelessWidget {
  const _CoinIcon({required this.color, required this.symbol});

  final Color color;
  final String symbol;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DesignConstants.iconSize56,
      height: DesignConstants.iconSize56,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(DesignConstants.spacing16),
      ),
      alignment: Alignment.center,
      child: Text(
        symbol[0],
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.black,
        ),
      ),
    );
  }
}
