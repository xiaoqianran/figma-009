import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_primary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Slide` (0:436).
class SettingsSlideScreen extends StatelessWidget {
  const SettingsSlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final summaryStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 40,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final estimateStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 16, color: AppColors.gray);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            WalletNavigationBar(
              title: '',
              leading: WalletNavigationBarActions.back(
                onPressed: () => context.pop(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(DesignConstants.spacing20),
                child: Column(
                  children: [
                    const Spacer(),
                    Text(r'$ 24,306', style: summaryStyle),
                    const SizedBox(height: DesignConstants.spacing8),
                    Text('Estimated 0.0223ETH', style: estimateStyle),
                    const Spacer(),
                    WalletPrimaryButton(
                      label: 'Slide to Swap',
                      onPressed: () => context.pop(),
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
