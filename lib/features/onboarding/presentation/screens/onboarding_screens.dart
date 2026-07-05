import 'package:figma_009/shared/widgets/figma_placeholder_screen.dart';
import 'package:flutter/material.dart';

export 'onboarding_screen.dart';
export 'seed_phrase_screen.dart';
export 'splash_screen.dart';

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Recovery');
  }
}
