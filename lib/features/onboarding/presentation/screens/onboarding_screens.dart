import 'package:figma_009/shared/widgets/figma_placeholder_screen.dart';
import 'package:flutter/material.dart';

export 'splash_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Onboarding');
  }
}

class SeedPhraseScreen extends StatelessWidget {
  const SeedPhraseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Seed Phrase');
  }
}

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Recovery');
  }
}
