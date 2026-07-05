import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/settings/data/wallet_settings_state.dart';
import 'package:figma_009/features/settings/presentation/screens/settings_autolock_screen.dart';
import 'package:figma_009/features/settings/presentation/screens/settings_method_screen.dart';
import 'package:figma_009/features/settings/presentation/screens/settings_price_alerts_screen.dart';
import 'package:figma_009/features/settings/presentation/screens/settings_security_screen.dart';
import 'package:figma_009/shared/widgets/cells/wallet_price_alert_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    WalletSettingsState.instance.setAutoLock(1);
    WalletSettingsState.instance.setLockMethod(1);
  });

  Future<void> pumpRoute(
    WidgetTester tester,
    String path,
    Widget screen,
  ) async {
    await tester.binding.setSurfaceSize(const Size(375, 812));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final router = GoRouter(
      initialLocation: path,
      routes: [GoRoute(path: path, builder: (context, state) => screen)],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();
  }

  testWidgets('SettingsAutoLockScreen selects option and updates state', (
    tester,
  ) async {
    await pumpRoute(
      tester,
      AppRoutes.settingsAutoLock,
      const SettingsAutoLockScreen(),
    );

    expect(find.text('If away for 1 hour'), findsOneWidget);

    await tester.tap(find.text('If away for 1 hour'));
    await tester.pump();

    expect(WalletSettingsState.instance.autoLockLabel, 'If away for 1 hour');
  });

  testWidgets('SettingsMethodScreen selects lock method', (tester) async {
    await pumpRoute(
      tester,
      AppRoutes.settingsMethod,
      const SettingsMethodScreen(),
    );

    await tester.tap(find.text('Passcode'));
    await tester.pump();

    expect(WalletSettingsState.instance.lockMethodLabel, 'Passcode');
  });

  testWidgets('SettingsSecurityScreen reflects selected settings', (
    tester,
  ) async {
    WalletSettingsState.instance.setAutoLock(2);
    WalletSettingsState.instance.setLockMethod(0);

    await pumpRoute(
      tester,
      AppRoutes.settingsSecurity,
      const SettingsSecurityScreen(),
    );

    expect(find.text('If away for 5 minute'), findsOneWidget);
    expect(find.text('Passcode'), findsWidgets);
  });

  testWidgets('SettingsPriceAlertsScreen renders token alert rows', (
    tester,
  ) async {
    await pumpRoute(
      tester,
      AppRoutes.settingsPriceAlerts,
      const SettingsPriceAlertsScreen(),
    );

    expect(find.text('Bitcoin'), findsOneWidget);
    expect(find.text('0.465 BTC'), findsOneWidget);
    expect(find.byType(WalletPriceAlertCell), findsNWidgets(4));
  });
}
