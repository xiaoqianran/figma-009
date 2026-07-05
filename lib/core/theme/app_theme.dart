import 'package:flutter/material.dart';

import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/core/theme/app_typography.dart';
import 'package:figma_009/core/theme/wallet_theme_extension.dart';

abstract final class AppTheme {
  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.white,
      brightness: Brightness.dark,
      surface: AppColors.black,
      onSurface: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.black,
      textTheme: AppTypography.textTheme().apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
      ),
      extensions: const <ThemeExtension<dynamic>>[WalletThemeExtension.dark],
    );
  }
}
