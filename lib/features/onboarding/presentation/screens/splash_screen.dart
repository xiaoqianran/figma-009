import 'dart:async';

import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/other/gradient_title_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Splash screen` (0:68).
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const Duration autoNavigateDelay = Duration(seconds: 2);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(SplashScreen.autoNavigateDelay, _goToOnboarding);
  }

  void _goToOnboarding() {
    if (!mounted) {
      return;
    }
    context.go(AppRoutes.onboarding);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.black,
      body: Center(child: GradientTitleText(text: 'AltCoin\nWallet ')),
    );
  }
}
