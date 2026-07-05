import 'package:figma_009/shared/widgets/figma_placeholder_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Settings');
  }
}

class SettingsWalletScreen extends StatelessWidget {
  const SettingsWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Settings - Wallet');
  }
}

class SettingsInputScreen extends StatelessWidget {
  const SettingsInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Settings - Input');
  }
}

class SettingsSlideScreen extends StatelessWidget {
  const SettingsSlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Settings - Slide');
  }
}

class SettingsSecurityScreen extends StatelessWidget {
  const SettingsSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Settings - Security');
  }
}

class SettingsPasscodeScreen extends StatelessWidget {
  const SettingsPasscodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(
      figmaFrame: 'Settings - Security - Passcode',
    );
  }
}

class SettingsAutoLockScreen extends StatelessWidget {
  const SettingsAutoLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(
      figmaFrame: 'Settings - Security - AutoLock',
    );
  }
}

class SettingsMethodScreen extends StatelessWidget {
  const SettingsMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(
      figmaFrame: 'Settings - Security - Method',
    );
  }
}

class SettingsPriceAlertsScreen extends StatelessWidget {
  const SettingsPriceAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(
      figmaFrame: 'Settings - Price Alerts',
      subtitle: 'Scroll variant merged into scrollable list',
    );
  }
}