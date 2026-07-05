import 'package:figma_009/core/router/app_router.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_theme.dart';
import 'package:figma_009/shared/widgets/bars/wallet_bottom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('Main shell switches bottom tabs', (tester) async {
    final router = createAppRouter();

    await tester.pumpWidget(
      MaterialApp.router(
        theme: AppTheme.dark(),
        routerConfig: router,
      ),
    );

    router.go(AppRoutes.wallet);
    await tester.pumpAndSettle();

    expect(find.byType(WalletBottomTabBar), findsOneWidget);
    expect(find.text('My Wallet'), findsOneWidget);

    router.go(AppRoutes.swap);
    await tester.pumpAndSettle();

    expect(find.text('Swap'), findsWidgets);

    router.go(AppRoutes.notification);
    await tester.pumpAndSettle();

    expect(find.text('Notification'), findsOneWidget);

    router.go(AppRoutes.settings);
    await tester.pumpAndSettle();

    expect(find.text('Settings'), findsOneWidget);
  });

  testWidgets('Main shell bottom tab bar switches tabs by tap', (tester) async {
    final router = createAppRouter();

    await tester.pumpWidget(
      MaterialApp.router(
        theme: AppTheme.dark(),
        routerConfig: router,
      ),
    );

    router.go(AppRoutes.wallet);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.swap_horiz));
    await tester.pumpAndSettle();
    expect(find.text('You Send'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.notifications_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Notification'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
    expect(find.text('Settings'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.account_balance_wallet_outlined));
    await tester.pumpAndSettle();
    expect(find.text('My Wallet'), findsOneWidget);
  });
}