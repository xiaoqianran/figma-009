import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/core/theme/wallet_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppColors', () {
    test('maps Figma paint styles to hex values', () {
      expect(AppColors.black, const Color(0xFF000000));
      expect(AppColors.white, const Color(0xFFFFFFFF));
      expect(AppColors.gray, const Color(0xFFA2A2AA));
      expect(AppColors.strokeDark, const Color(0xFF212121));
      expect(AppColors.blurOverlay, const Color(0x80000000));
    });

    test('titleGradient has five stops from Figma Gradient style', () {
      expect(AppColors.titleGradient.colors, hasLength(5));
      expect(AppColors.titleGradient.stops, hasLength(5));
    });
  });

  group('WalletThemeExtension', () {
    test('dark preset uses AppColors tokens', () {
      const ext = WalletThemeExtension.dark;
      expect(ext.blurSurface, AppColors.blurOverlay);
      expect(ext.cardStroke, AppColors.strokeMuted);
      expect(ext.subtitle, AppColors.gray);
    });

    test('lerp interpolates between extensions', () {
      const a = WalletThemeExtension.dark;
      const b = WalletThemeExtension(
        blurSurface: Color(0xFFFFFFFF),
        cardStroke: Color(0xFFFFFFFF),
        subtitle: Color(0xFFFFFFFF),
      );
      final mid = a.lerp(b, 0.5);
      expect(mid.blurSurface, isNotNull);
      expect(mid.cardStroke, isNotNull);
      expect(mid.subtitle, isNotNull);
    });
  });
}
