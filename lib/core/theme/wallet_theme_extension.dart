import 'package:flutter/material.dart';

import 'package:figma_009/core/theme/app_colors.dart';

/// Custom design tokens not covered by standard [ThemeData].
@immutable
class WalletThemeExtension extends ThemeExtension<WalletThemeExtension> {
  const WalletThemeExtension({
    required this.blurSurface,
    required this.cardStroke,
    required this.subtitle,
  });

  final Color blurSurface;
  final Color cardStroke;
  final Color subtitle;

  @override
  WalletThemeExtension copyWith({
    Color? blurSurface,
    Color? cardStroke,
    Color? subtitle,
  }) {
    return WalletThemeExtension(
      blurSurface: blurSurface ?? this.blurSurface,
      cardStroke: cardStroke ?? this.cardStroke,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  @override
  WalletThemeExtension lerp(
    ThemeExtension<WalletThemeExtension>? other,
    double t,
  ) {
    if (other is! WalletThemeExtension) {
      return this;
    }
    return WalletThemeExtension(
      blurSurface: Color.lerp(blurSurface, other.blurSurface, t)!,
      cardStroke: Color.lerp(cardStroke, other.cardStroke, t)!,
      subtitle: Color.lerp(subtitle, other.subtitle, t)!,
    );
  }

  static const WalletThemeExtension dark = WalletThemeExtension(
    blurSurface: AppColors.blurOverlay,
    cardStroke: AppColors.strokeMuted,
    subtitle: AppColors.gray,
  );
}