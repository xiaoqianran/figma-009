import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/settings/data/mock_price_alerts.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_price_alert_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Price Alerts` (0:586) / Scroll (0:600).
class SettingsPriceAlertsScreen extends StatefulWidget {
  const SettingsPriceAlertsScreen({super.key});

  @override
  State<SettingsPriceAlertsScreen> createState() =>
      _SettingsPriceAlertsScreenState();
}

class _SettingsPriceAlertsScreenState extends State<SettingsPriceAlertsScreen> {
  late final List<bool> _enabled = List<bool>.from(
    MockPriceAlerts.defaultEnabled,
  );

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
                itemCount: MockPriceAlerts.tokens.length,
                itemBuilder: (context, index) {
                  return WalletPriceAlertCell(
                    token: MockPriceAlerts.tokens[index],
                    enabled: _enabled[index],
                    onChanged: (value) {
                      setState(() => _enabled[index] = value);
                    },
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
