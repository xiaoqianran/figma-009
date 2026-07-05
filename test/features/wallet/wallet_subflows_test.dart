import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/wallet/presentation/screens/wallet_screens.dart';
import 'package:figma_009/features/wallet/presentation/widgets/wallet_token_balance_card.dart';
import 'package:figma_009/shared/widgets/cells/wallet_notification_cell.dart';
import 'package:figma_009/shared/widgets/cells/wallet_token_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('DetailScreen renders token title and history', (tester) async {
    final router = GoRouter(
      initialLocation: '${AppRoutes.detail}/btc',
      routes: [
        GoRoute(
          path: '${AppRoutes.detail}/:id',
          builder: (context, state) => const DetailScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Bitcoin'), findsOneWidget);
    expect(find.byType(WalletTokenBalanceCard), findsOneWidget);
    expect(find.byType(WalletNotificationCell), findsAtLeastNWidgets(2));
  });

  testWidgets('WalletScrollScreen renders extended token list', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.walletScroll,
      routes: [
        GoRoute(
          path: AppRoutes.walletScroll,
          builder: (context, state) => const WalletScrollScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('My Wallet'), findsOneWidget);
    expect(find.byType(WalletTokenCell), findsAtLeastNWidgets(2));
    expect(find.text('Bitcoin'), findsOneWidget);
  });

  testWidgets('ScanScreen renders QR scanner placeholder', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.scan,
      routes: [
        GoRoute(
          path: AppRoutes.scan,
          builder: (context, state) => const ScanScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Scan'), findsOneWidget);
    expect(find.text('Freddy'), findsOneWidget);
    expect(find.byKey(const ValueKey('scan-icon')), findsOneWidget);
  });
}
