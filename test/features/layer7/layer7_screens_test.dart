import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/notification/presentation/screens/notification_screens.dart';
import 'package:figma_009/features/settings/presentation/screens/settings_screens.dart';
import 'package:figma_009/features/token/presentation/screens/token_screens.dart';
import 'package:figma_009/features/transaction/presentation/screens/transaction_screens.dart';
import 'package:figma_009/features/transaction/presentation/widgets/swap_token_card.dart';
import 'package:figma_009/shared/widgets/cells/wallet_add_token_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_coin_icon.dart';
import 'package:figma_009/shared/widgets/cells/wallet_notification_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('SwapScreen renders swap cards', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.swap,
      routes: [
        GoRoute(
          path: AppRoutes.swap,
          builder: (context, state) => const SwapScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Swap'), findsWidgets);
    expect(find.byType(SwapTokenCard), findsNWidgets(2));
    expect(find.text('You Send'), findsOneWidget);
    expect(find.text('You Get'), findsOneWidget);
  });

  testWidgets('NotificationScreen renders notification list', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.notification,
      routes: [
        GoRoute(
          path: AppRoutes.notification,
          builder: (context, state) => const NotificationScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Notification'), findsOneWidget);
    expect(find.byType(WalletNotificationCell), findsAtLeastNWidgets(2));
  });

  testWidgets('SettingsScreen renders profile and menu', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.settings,
      routes: [
        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Freddy'), findsOneWidget);
    expect(find.text('Security'), findsOneWidget);
    expect(find.text('Price Alerts'), findsOneWidget);
    expect(find.byType(WalletCoinIcon), findsNWidgets(4));
  });

  testWidgets('AddTokenScreen renders token list', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.addToken,
      routes: [
        GoRoute(
          path: AppRoutes.addToken,
          builder: (context, state) => const AddTokenScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Add Token'), findsOneWidget);
    expect(find.byType(WalletAddTokenCell), findsAtLeastNWidgets(2));
  });

  testWidgets('CustomTokenScreen renders inputs and actions', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.customToken,
      routes: [
        GoRoute(
          path: AppRoutes.customToken,
          builder: (context, state) => const CustomTokenScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Custom'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);
  });
}
