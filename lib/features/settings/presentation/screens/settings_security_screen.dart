import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_list_menu_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Security` (0:517).
class SettingsSecurityScreen extends StatelessWidget {
  const SettingsSecurityScreen({super.key});

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
                title: 'Security',
                textAlign: TextAlign.center,
                underlineWidth: 168,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing16),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                children: [
                  WalletListMenuCell(
                    title: 'Passcode',
                    onTap: () => context.push(AppRoutes.settingsPasscode),
                  ),
                  WalletListMenuCell(
                    title: 'Auto - Lock',
                    subtitle: 'Immediate',
                    onTap: () => context.push(AppRoutes.settingsAutoLock),
                  ),
                  WalletListMenuCell(
                    title: 'Lock Method',
                    subtitle: 'Passcode',
                    onTap: () => context.push(AppRoutes.settingsMethod),
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
