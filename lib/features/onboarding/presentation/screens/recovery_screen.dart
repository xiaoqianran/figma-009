import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/onboarding/data/mock_seed_phrase.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_primary_button.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_secondary_button.dart';
import 'package:figma_009/shared/widgets/other/wallet_input_field.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Recovery` (0:45).
class RecoveryScreen extends StatefulWidget {
  const RecoveryScreen({super.key});

  @override
  State<RecoveryScreen> createState() => _RecoveryScreenState();
}

class _RecoveryScreenState extends State<RecoveryScreen> {
  String _phrase = '';
  String _walletName = 'Main Wallet';

  @override
  Widget build(BuildContext context) {
    final phrasePreview = MockSeedPhrase.words.join('  •  ');

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            WalletNavigationBar(
              title: '',
              leading: WalletNavigationBarActions.back(
                onPressed: () => context.go(AppRoutes.onboarding),
              ),
              trailing: WalletNavigationBarActions.search(onPressed: () {}),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                child: Column(
                  children: [
                    const WalletSectionTitle(
                      title: 'Recovery',
                      textAlign: TextAlign.center,
                      underlineWidth: 205,
                    ),
                    const SizedBox(height: DesignConstants.spacing20),
                    WalletInputField(
                      label: 'Recovery Phrase',
                      value: _phrase,
                      hint: phrasePreview,
                      maxLines: 4,
                      minHeight: 165,
                      onChanged: (value) => setState(() => _phrase = value),
                    ),
                    const SizedBox(height: DesignConstants.spacing24),
                    WalletInputField(
                      label: 'Name',
                      value: _walletName,
                      onChanged: (value) => setState(() => _walletName = value),
                    ),
                    const SizedBox(height: DesignConstants.spacing32),
                    Row(
                      children: [
                        Expanded(
                          child: WalletSecondaryButton(
                            label: 'Cancel',
                            onPressed: () => context.go(AppRoutes.onboarding),
                          ),
                        ),
                        const SizedBox(width: DesignConstants.spacing12),
                        Expanded(
                          child: WalletPrimaryButton(
                            label: 'Add',
                            onPressed: () => context.go(AppRoutes.wallet),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: DesignConstants.spacing24),
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
