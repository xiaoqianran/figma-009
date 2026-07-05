import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/other/wallet_input_field.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Wallet` (0:320).
class SettingsWalletScreen extends StatefulWidget {
  const SettingsWalletScreen({super.key});

  @override
  State<SettingsWalletScreen> createState() => _SettingsWalletScreenState();
}

class _SettingsWalletScreenState extends State<SettingsWalletScreen> {
  String _name = 'Freddy';

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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                child: Column(
                  children: [
                    const WalletSectionTitle(
                      title: 'Wallet',
                      textAlign: TextAlign.center,
                      underlineWidth: 140,
                    ),
                    const SizedBox(height: DesignConstants.spacing24),
                    WalletInputField(
                      label: 'Name',
                      value: _name,
                      onChanged: (value) => setState(() => _name = value),
                    ),
                    const SizedBox(height: DesignConstants.spacing16),
                    const WalletInputField(
                      label: 'Address',
                      value: 'an21vnvnvok2vvaxm396',
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
