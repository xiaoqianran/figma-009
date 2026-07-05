import 'package:flutter/material.dart';

/// Typography from Figma: Clash Display + Poppins (both bundled in assets/fonts).
abstract final class AppTypography {
  static const String clashDisplayFamily = 'Clash Display';
  static const String poppinsFamily = 'Poppins';

  static TextTheme textTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontFamily: clashDisplayFamily,
        fontSize: 40,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      headlineMedium: TextStyle(
        fontFamily: clashDisplayFamily,
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 1.25,
      ),
      titleMedium: TextStyle(
        fontFamily: poppinsFamily,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontFamily: poppinsFamily,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
    );
  }
}
