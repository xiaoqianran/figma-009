import 'package:figma_009/shared/widgets/figma_placeholder_screen.dart';
import 'package:flutter/material.dart';

class AddTokenScreen extends StatelessWidget {
  const AddTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Add Token');
  }
}

class AddTokenSearchScreen extends StatelessWidget {
  const AddTokenSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(
      figmaFrame: 'Add Token - Search',
      subtitle: 'Search state; scroll handled in same screen',
    );
  }
}

class CustomTokenScreen extends StatelessWidget {
  const CustomTokenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Custom Token');
  }
}