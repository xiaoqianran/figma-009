import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_switch_toggle.dart';
import 'package:figma_009/shared/widgets/other/wallet_coin_icon.dart';
import 'package:figma_009/shared/widgets/other/wallet_trend_icon.dart';
import 'package:flutter/material.dart';

/// Figma Price Alerts list row — token stats + switch toggle.
class WalletPriceAlertCell extends StatelessWidget {
  const WalletPriceAlertCell({
    required this.token,
    required this.enabled,
    required this.onChanged,
    super.key,
  });

  final WalletToken token;
  final bool enabled;
  final ValueChanged<bool> onChanged;

  static const double _switchGutter =
      WalletSwitchToggle.width + DesignConstants.spacing8;

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

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignConstants.spacing8),
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: _switchGutter),
                child: Row(
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
                              Expanded(
                                child: Text(
                                  token.name,
                                  style: nameStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: DesignConstants.spacing8),
                              Flexible(
                                child: Text(
                                  token.fiatValue,
                                  style: amountStyle,
                                  textAlign: TextAlign.end,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: DesignConstants.spacing4),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  token.amount,
                                  style: amountStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  token.changePercent,
                                  style: changeStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: DesignConstants.spacing4),
                              WalletTrendIcon(isUp: token.isUp),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                top: DesignConstants.spacing8,
                child: WalletSwitchToggle(
                  value: enabled,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignConstants.spacing8),
          const Divider(height: 1, color: Color(0xFF1E1E1E)),
        ],
      ),
    );
  }
}