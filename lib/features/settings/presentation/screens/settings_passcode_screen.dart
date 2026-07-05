import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Security - Passcode` (0:488).
class SettingsPasscodeScreen extends StatelessWidget {
  const SettingsPasscodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final digitStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );

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
            const WalletSectionTitle(
              title: 'Passcode',
              textAlign: TextAlign.center,
              underlineWidth: 180,
            ),
            const SizedBox(height: DesignConstants.spacing32),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing32,
                ),
                mainAxisSpacing: DesignConstants.spacing16,
                children: [
                  for (final key in [
                    '1',
                    '2',
                    '3',
                    '4',
                    '5',
                    '6',
                    '7',
                    '8',
                    '9',
                    '',
                    '0',
                    '⌫',
                  ])
                    Center(
                      child: key.isEmpty
                          ? const SizedBox.shrink()
                          : Text(key, style: digitStyle),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
