import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_list_menu_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Security - AutoLock` (0:534).
class SettingsAutoLockScreen extends StatelessWidget {
  const SettingsAutoLockScreen({super.key});

  static const _options = [
    'Immediate',
    'After 1 minute',
    'After 5 minutes',
    'After 15 minutes',
  ];

  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'Auto - Lock',
                textAlign: TextAlign.center,
                underlineWidth: 200,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                itemCount: _options.length,
                itemBuilder: (context, index) {
                  return WalletListMenuCell(
                    title: _options[index],
                    onTap: () => context.pop(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
