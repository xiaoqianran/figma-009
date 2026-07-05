import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_primary_button.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_secondary_button.dart';
import 'package:figma_009/shared/widgets/other/wallet_input_field.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Custom Token` (0:185).
class CustomTokenScreen extends StatefulWidget {
  const CustomTokenScreen({super.key});

  @override
  State<CustomTokenScreen> createState() => _CustomTokenScreenState();
}

class _CustomTokenScreenState extends State<CustomTokenScreen> {
  String _address = 'an21vnvnvok2vvaxm396';
  String _symbol = 'VAP';
  String _precision = '99';

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
                      title: 'Custom',
                      textAlign: TextAlign.center,
                      underlineWidth: 140,
                    ),
                    const SizedBox(height: DesignConstants.spacing24),
                    WalletInputField(
                      label: 'Token Address',
                      value: _address,
                      onChanged: (v) => setState(() => _address = v),
                    ),
                    const SizedBox(height: DesignConstants.spacing16),
                    WalletInputField(
                      label: 'Token Symbol',
                      value: _symbol,
                      onChanged: (v) => setState(() => _symbol = v),
                    ),
                    const SizedBox(height: DesignConstants.spacing16),
                    WalletInputField(
                      label: 'Token of Precision',
                      value: _precision,
                      onChanged: (v) => setState(() => _precision = v),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(DesignConstants.spacing20),
              child: Row(
                children: [
                  Expanded(
                    child: WalletSecondaryButton(
                      label: 'Cancel',
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const SizedBox(width: DesignConstants.spacing16),
                  Expanded(
                    child: WalletPrimaryButton(
                      label: 'Add',
                      onPressed: () => context.pop(),
                    ),
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
