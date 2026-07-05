import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/onboarding/presentation/screens/splash_screen.dart';
import 'package:figma_009/shared/widgets/other/gradient_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('SplashScreen navigates to onboarding after delay', (
    tester,
  ) async {
    final router = GoRouter(
      initialLocation: AppRoutes.splash,
      routes: [
        GoRoute(
          path: AppRoutes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) =>
              const Scaffold(body: Center(child: Text('Onboarding'))),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.byType(GradientTitleText), findsOneWidget);

    await tester.pump(SplashScreen.autoNavigateDelay);
    await tester.pumpAndSettle();

    expect(find.text('Onboarding'), findsOneWidget);
  });
}
