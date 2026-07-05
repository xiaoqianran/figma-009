export 'wallet_screen.dart';

import 'package:figma_009/shared/widgets/figma_placeholder_screen.dart';
import 'package:flutter/material.dart';

class WalletScrollScreen extends StatelessWidget {
  const WalletScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(
      figmaFrame: 'Wallet - Scroll',
      subtitle: 'Scroll variant of main wallet list',
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Detail');
  }
}

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Scan');
  }
}
