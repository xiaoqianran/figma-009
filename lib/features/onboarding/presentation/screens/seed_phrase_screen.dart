import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/onboarding/data/mock_seed_phrase.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_primary_button.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_secondary_button.dart';
import 'package:figma_009/shared/widgets/other/seed_phrase_chip.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Seed Phrase` (0:25).
class SeedPhraseScreen extends StatelessWidget {
  const SeedPhraseScreen({super.key});

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
                onPressed: () => context.go(AppRoutes.onboarding),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                child: Column(
                  children: [
                    const WalletSectionTitle(
                      title: 'Seed Phrase',
                      textAlign: TextAlign.center,
                      underlineWidth: 258,
                    ),
                    const SizedBox(height: DesignConstants.spacing20),
                    Expanded(
                      child: _SeedPhraseGrid(words: MockSeedPhrase.words),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: WalletSecondaryButton(
                            label: 'Copy',
                            onPressed: () => _copySeedPhrase(context),
                          ),
                        ),
                        const SizedBox(width: DesignConstants.spacing12),
                        Expanded(
                          child: WalletPrimaryButton(
                            label: 'Continue',
                            onPressed: () => context.go(AppRoutes.wallet),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: DesignConstants.spacing16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _copySeedPhrase(BuildContext context) {
    Clipboard.setData(ClipboardData(text: MockSeedPhrase.words.join(' ')));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Seed phrase copied')));
  }
}

class _SeedPhraseGrid extends StatelessWidget {
  const _SeedPhraseGrid({required this.words});

  final List<String> words;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: DesignConstants.spacing10,
        crossAxisSpacing: DesignConstants.spacing10,
        childAspectRatio: 162 / 56,
      ),
      itemCount: words.length,
      itemBuilder: (context, index) {
        return SeedPhraseChip(index: index + 1, word: words[index]);
      },
    );
  }
}
