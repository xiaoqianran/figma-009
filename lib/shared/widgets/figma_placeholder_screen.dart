import 'package:flutter/material.dart';

/// Temporary scaffold used while implementing Figma screens.
class FigmaPlaceholderScreen extends StatelessWidget {
  const FigmaPlaceholderScreen({
    required this.figmaFrame,
    super.key,
    this.subtitle,
  });

  final String figmaFrame;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                figmaFrame,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 8),
                Text(subtitle!, style: Theme.of(context).textTheme.bodySmall),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
