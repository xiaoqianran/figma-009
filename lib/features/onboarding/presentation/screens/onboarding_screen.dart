import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_onboarding_next_button.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Onboarding` (0:57).
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignConstants.spacing20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: DesignConstants.spacing24),
              const WalletSectionTitle(
                title: 'Welcome to the safest Crypto Wallet',
                underlineWidth: 140,
              ),
              const SizedBox(height: DesignConstants.spacing32),
              Expanded(child: Center(child: _OnboardingHeroImage())),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => context.go(AppRoutes.recovery),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.white,
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'I have a wallet',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Transform.rotate(
                    angle: 3.14159,
                    child: WalletOnboardingNextButton(
                      onPressed: () => context.go(AppRoutes.seedPhrase),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: DesignConstants.spacing24),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingHeroImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DesignConstants.cornerRadiusMd),
      child: Image.asset(
        'assets/images/onboarding_hero.png',
        width: 335,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: 335,
            height: 286,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                DesignConstants.cornerRadiusMd,
              ),
              gradient: AppColors.blueGradient,
            ),
          );
        },
      ),
    );
  }
}
