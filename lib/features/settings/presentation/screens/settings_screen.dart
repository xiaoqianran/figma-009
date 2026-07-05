import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/transaction/presentation/widgets/wallet_receive_profile_card.dart';
import 'package:figma_009/shared/widgets/cells/wallet_list_menu_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings` (0:472).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _walletName = 'Freddy';
  static const _walletAddress = 'an21vnvnvok2vvaxm396';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignConstants.spacing16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'Settings',
                textAlign: TextAlign.center,
                underlineWidth: 168,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing24),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: InkWell(
                onTap: () => context.push(AppRoutes.settingsWallet),
                child: const WalletReceiveProfileCard(
                  name: _walletName,
                  address: _walletAddress,
                ),
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
                    title: 'Security',
                    onTap: () => context.push(AppRoutes.settingsSecurity),
                  ),
                  WalletListMenuCell(
                    title: 'Preferences',
                    onTap: () => context.push(AppRoutes.settingsInput),
                  ),
                  WalletListMenuCell(title: 'Push Notification', onTap: () {}),
                  WalletListMenuCell(
                    title: 'Price Alerts',
                    onTap: () => context.push(AppRoutes.settingsPriceAlerts),
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
