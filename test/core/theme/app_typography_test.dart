import 'package:figma_009/core/theme/app_theme.dart';
import 'package:figma_009/core/theme/app_typography.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('display styles use bundled Clash Display', () {
    final theme = AppTypography.textTheme();

    expect(theme.displayLarge?.fontFamily, AppTypography.clashDisplayFamily);
    expect(theme.headlineMedium?.fontFamily, AppTypography.clashDisplayFamily);
  });

  test('body styles use bundled Poppins', () {
    final theme = AppTypography.textTheme();

    expect(theme.titleMedium?.fontFamily, AppTypography.poppinsFamily);
    expect(theme.bodySmall?.fontFamily, AppTypography.poppinsFamily);
  });

  test('AppTheme applies Clash Display to displayLarge', () {
    final theme = AppTheme.dark();

    expect(
      theme.textTheme.displayLarge?.fontFamily,
      AppTypography.clashDisplayFamily,
    );
  });
}
