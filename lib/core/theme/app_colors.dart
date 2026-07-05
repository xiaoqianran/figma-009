import 'package:flutter/material.dart';

/// Paint styles from Figma: Black, White, Gray, Green, Pink, Blue, Blur.
abstract final class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFA2A2AA);
  static const Color surfaceDark = Color(0xFF141414);
  static const Color strokeDark = Color(0xFF212121);
  static const Color strokeMuted = Color(0xFF191919);
  static const Color blurOverlay = Color(0x80000000);

  static const LinearGradient titleGradient = LinearGradient(
    colors: [Color(0xFF81FF81), Color(0xFFFFFEFE), Color(0xFF8B8AFF), Color(0xFFFFFFFF), Color(0xFF37FF53)],
    stops: [0.0, 0.34, 0.48, 0.71, 1.0],
  );
}