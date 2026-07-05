import 'package:flutter/material.dart';

/// Paint styles from Figma: Black, White, Gray, Green, Pink, Blue, Gradient, Blur.
abstract final class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFFA2A2AA);
  static const Color surfaceDark = Color(0xFF141414);
  static const Color strokeDark = Color(0xFF212121);
  static const Color strokeMuted = Color(0xFF191919);
  static const Color blurOverlay = Color(0x80000000);

  /// Figma paint style `Gradient` — splash title fill.
  static const LinearGradient titleGradient = LinearGradient(
    begin: Alignment(-0.48, -0.38),
    end: Alignment(0.38, 0.48),
    colors: [
      Color(0xFF81FF81),
      Color(0xFFFBFEFD),
      Color(0xFF8B8AFF),
      Color(0xFFFFFFFF),
      Color(0xFF37FF87),
    ],
    stops: [0.0, 0.34, 0.48, 0.71, 1.0],
  );

  /// Figma paint style `Green` (radial).
  static const RadialGradient greenGradient = RadialGradient(
    colors: [Color(0xFFECEDEC), Color(0xFFB8FF00)],
    stops: [0.0, 1.0],
  );

  /// Figma paint style `Pink` (radial).
  static const RadialGradient pinkGradient = RadialGradient(
    colors: [Color(0xFFFFF1F1), Color(0xFFFFBABA)],
    stops: [0.0, 1.0],
  );

  /// Figma paint style `Blue` (radial).
  static const RadialGradient blueGradient = RadialGradient(
    colors: [Color(0xFFF0F5FF), Color(0xFFB0C7FF)],
    stops: [0.0, 1.0],
  );
}
