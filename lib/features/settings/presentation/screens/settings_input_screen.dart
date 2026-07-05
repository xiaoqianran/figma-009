import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/transaction/presentation/widgets/swap_token_card.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Input` (0:416) — swap preferences with filled amounts.
class SettingsInputScreen extends StatelessWidget {
  const SettingsInputScreen({super.key});

  static const _sendToken = SwapTokenData(
    label: 'You Send',
    name: 'Bitcoin',
    amount: '0.045',
    balance: 'Balance : 0.955 BTC',
    rate: r'1 BTC = $34,377.08',
    iconColor: Color(0xFFB0C7FF),
  );

  static const _receiveToken = SwapTokenData(
    label: 'You Get',
    name: 'Ripple',
    amount: '52,584',
    balance: 'Balance : 52,684 XRP',
    rate: r'1 XRP = $0.652',
    iconColor: Color(0xFFB8FF00),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            WalletNavigationBar(
              title: 'Swap',
              leading: WalletNavigationBarActions.back(
                onPressed: () => context.pop(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(DesignConstants.spacing20),
                child: Column(
                  children: [
                    const SwapTokenCard(token: _sendToken),
                    const SizedBox(height: DesignConstants.spacing16),
                    const SwapTokenCard(token: _receiveToken),
                    const SizedBox(height: DesignConstants.spacing32),
                    WalletPrimaryButton(
                      label: 'Continue',
                      onPressed: () => context.push(AppRoutes.settingsSlide),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
