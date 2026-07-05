import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/wallet/presentation/screens/wallet_screen.dart';
import 'package:figma_009/features/wallet/presentation/screens/wallet_scroll_screen.dart';
import 'package:figma_009/features/wallet/presentation/widgets/wallet_balance_card.dart';
import 'package:figma_009/shared/widgets/cells/wallet_token_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('WalletScreen renders balance and token list', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.wallet,
      routes: [
        GoRoute(
          path: AppRoutes.wallet,
          builder: (context, state) => const WalletScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('My Wallet'), findsOneWidget);
    expect(find.textContaining('24,306'), findsOneWidget);
    expect(find.byType(WalletTokenCell), findsAtLeastNWidgets(2));
    expect(find.text('Bitcoin'), findsOneWidget);
    expect(find.text('Send'), findsOneWidget);
  });

  testWidgets('WalletScreen balance card opens scroll list', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.wallet,
      routes: [
        GoRoute(
          path: AppRoutes.wallet,
          builder: (context, state) => const WalletScreen(),
          routes: [
            GoRoute(
              path: 'scroll',
              builder: (context, state) => const WalletScrollScreen(),
            ),
          ],
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.byKey(const ValueKey('nav-back')), findsNothing);

    await tester.tap(find.byType(WalletBalanceCard));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('nav-back')), findsOneWidget);
    expect(find.byType(WalletScrollScreen), findsOneWidget);
  });
}
