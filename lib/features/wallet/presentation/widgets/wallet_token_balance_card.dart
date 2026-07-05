import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/other/wallet_asset_icon.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma Detail frame balance card for a single token.
class WalletTokenBalanceCard extends StatelessWidget {
  const WalletTokenBalanceCard({required this.token, super.key});

  final WalletToken token;

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 16, color: AppColors.black);
    final balanceStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
    final actionStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: DesignConstants.spacing20),
      padding: const EdgeInsets.fromLTRB(
        DesignConstants.spacing20,
        DesignConstants.spacing32,
        DesignConstants.spacing20,
        DesignConstants.spacing24,
      ),
      decoration: BoxDecoration(
        gradient: AppColors.titleGradient,
        borderRadius: BorderRadius.circular(34),
        border: Border.all(color: const Color(0x0C000000)),
      ),
      child: Column(
        children: [
          Text(MockWalletTokens.detailBalanceLabel(token), style: labelStyle),
          const SizedBox(height: DesignConstants.spacing8),
          Text(MockWalletTokens.detailBalanceValue(token), style: balanceStyle),
          const SizedBox(height: DesignConstants.spacing24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _QuickAction(
                label: 'Send',
                icon: const WalletAssetIcon(
                  WalletAssets.iconSend,
                  color: AppColors.black,
                ),
                onPressed: () => context.push(AppRoutes.send, extra: token),
                labelStyle: actionStyle,
              ),
              _QuickAction(
                label: 'Receive',
                icon: const WalletAssetIcon(
                  WalletAssets.iconDown,
                  color: AppColors.black,
                ),
                onPressed: () => context.push(AppRoutes.receive),
                labelStyle: actionStyle,
              ),
              _QuickAction(
                label: 'Buy',
                icon: const WalletAssetIcon(
                  WalletAssets.iconBuy,
                  color: AppColors.black,
                ),
                onPressed: () => context.push(AppRoutes.buy, extra: token),
                labelStyle: actionStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.labelStyle,
  });

  final String label;
  final Widget icon;
  final VoidCallback onPressed;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WalletCircleButton(icon: icon, onPressed: onPressed),
        const SizedBox(height: DesignConstants.spacing8),
        Text(label, style: labelStyle),
      ],
    );
  }
}
