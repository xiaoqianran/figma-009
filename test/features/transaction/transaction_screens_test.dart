import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/transaction/presentation/screens/transaction_screens.dart';
import 'package:figma_009/features/transaction/presentation/widgets/wallet_market_token_cell.dart';
import 'package:figma_009/shared/widgets/cells/wallet_token_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('SendScreen renders coin list', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.send,
      routes: [
        GoRoute(
          path: AppRoutes.send,
          builder: (context, state) => const SendScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('My Coin'), findsOneWidget);
    expect(find.byType(WalletTokenCell), findsAtLeastNWidgets(2));
  });

  testWidgets('BuyScreen renders market list', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.buy,
      routes: [
        GoRoute(
          path: AppRoutes.buy,
          builder: (context, state) => const BuyScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Alt coin'), findsOneWidget);
    expect(find.byType(WalletMarketTokenCell), findsAtLeastNWidgets(2));
  });

  testWidgets('ReceiveScreen renders profile and actions', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.receive,
      routes: [
        GoRoute(
          path: AppRoutes.receive,
          builder: (context, state) => const ReceiveScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Receive'), findsOneWidget);
    expect(find.text('Freddy'), findsOneWidget);
    expect(find.text('Set Amount'), findsOneWidget);
  });

  testWidgets('SendDetailScreen renders amount panel', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.sendDetail,
      routes: [
        GoRoute(
          path: AppRoutes.sendDetail,
          builder: (context, state) => const SendDetailScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text(r'$ 6,405'), findsOneWidget);
    expect(find.text('Slide to Swap'), findsOneWidget);
  });
}
