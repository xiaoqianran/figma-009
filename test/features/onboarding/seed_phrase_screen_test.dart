import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/onboarding/presentation/screens/seed_phrase_screen.dart';
import 'package:figma_009/shared/widgets/other/seed_phrase_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('SeedPhraseScreen renders 12 mnemonic chips', (tester) async {
    final router = GoRouter(
      initialLocation: AppRoutes.seedPhrase,
      routes: [
        GoRoute(
          path: AppRoutes.seedPhrase,
          builder: (context, state) => const SeedPhraseScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();

    expect(find.text('Seed Phrase'), findsOneWidget);
    expect(find.byType(SeedPhraseChip), findsAtLeastNWidgets(6));
    expect(find.text('car'), findsOneWidget);
    expect(find.text('Copy'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });
}
