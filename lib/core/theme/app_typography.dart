import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Typography from Figma: Clash Display + Poppins.
///
/// Clash Display is not on Google Fonts; bundle it under `assets/fonts/` later.
/// Until then, Space Grotesk is used as the display fallback.
abstract final class AppTypography {
  static TextTheme textTheme() {
    final display = GoogleFonts.spaceGrotesk();
    final poppins = GoogleFonts.poppins();

    return TextTheme(
      displayLarge: display.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
      headlineMedium: display.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 1.25,
      ),
      titleMedium: poppins.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
      bodySmall: poppins.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5,
      ),
    );
  }
}
