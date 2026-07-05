import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_list_menu_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Price Alerts` (0:586).
class SettingsPriceAlertsScreen extends StatelessWidget {
  const SettingsPriceAlertsScreen({super.key});

  static const _alerts = [
    ('Bitcoin', 'Above \$40,000'),
    ('Ethereum', 'Below \$5,000'),
    ('Ripple', 'Above \$1.00'),
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
                title: 'Price Alerts',
                textAlign: TextAlign.center,
                underlineWidth: 220,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                itemCount: _alerts.length,
                itemBuilder: (context, index) {
                  final (name, rule) = _alerts[index];
                  return WalletListMenuCell(
                    title: name,
                    subtitle: rule,
                    onTap: () {},
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
