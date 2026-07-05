import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/onboarding/presentation/screens/recovery_screen.dart';
import 'package:figma_009/shared/widgets/other/wallet_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('RecoveryScreen renders inputs and actions', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.recovery,
      routes: [
        GoRoute(
          path: AppRoutes.recovery,
          builder: (context, state) => const RecoveryScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Recovery'), findsOneWidget);
    expect(find.byType(WalletInputField), findsNWidgets(2));
    expect(find.text('Cancel'), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);
    expect(find.text('Main Wallet'), findsOneWidget);
  });
}
