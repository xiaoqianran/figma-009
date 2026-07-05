import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_onboarding_next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  Widget buildRouter(String initialLocation) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: initialLocation,
        routes: [
          GoRoute(
            path: AppRoutes.onboarding,
            builder: (context, state) => const OnboardingScreen(),
          ),
          GoRoute(
            path: AppRoutes.seedPhrase,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Seed Phrase'))),
          ),
          GoRoute(
            path: AppRoutes.recovery,
            builder: (context, state) =>
                const Scaffold(body: Center(child: Text('Recovery'))),
          ),
        ],
      ),
    );
  }

  testWidgets('OnboardingScreen renders welcome title', (tester) async {
    await tester.pumpWidget(buildRouter(AppRoutes.onboarding));
    await tester.pump();

    expect(find.textContaining('Welcome to the safest'), findsOneWidget);
    expect(find.text('I have a wallet'), findsOneWidget);
  });

  testWidgets('next button navigates to seed phrase', (tester) async {
    await tester.pumpWidget(buildRouter(AppRoutes.onboarding));
    await tester.pump();

    await tester.tap(find.byType(WalletOnboardingNextButton));
    await tester.pumpAndSettle();

    expect(find.text('Seed Phrase'), findsOneWidget);
  });

  testWidgets('I have a wallet navigates to recovery', (tester) async {
    await tester.pumpWidget(buildRouter(AppRoutes.onboarding));
    await tester.pump();

    await tester.tap(find.text('I have a wallet'));
    await tester.pumpAndSettle();

    expect(find.text('Recovery'), findsOneWidget);
  });
}
