import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/features/settings/presentation/screens/settings_passcode_screen.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_passcode_key.dart';
import 'package:figma_009/shared/widgets/other/wallet_passcode_input_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> pumpPasscodeScreen(WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(375, 812));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    final router = GoRouter(
      initialLocation: AppRoutes.settingsPasscode,
      routes: [
        GoRoute(
          path: AppRoutes.settingsPasscode,
          builder: (context, state) => const SettingsPasscodeScreen(),
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pump();
  }

  testWidgets('SettingsPasscodeScreen renders input card and keypad', (
    tester,
  ) async {
    await pumpPasscodeScreen(tester);

    expect(find.text('Passcode'), findsOneWidget);
    expect(find.text('Enter your passcode'), findsOneWidget);
    expect(find.byType(WalletPasscodeInputCard), findsOneWidget);
    expect(find.text('Slide to Save'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('SettingsPasscodeScreen fills dots as digits are entered', (
    tester,
  ) async {
    await pumpPasscodeScreen(tester);

    await tester.tap(find.text('1'));
    await tester.pump();
    await tester.tap(find.text('2'));
    await tester.pump();

    final card = tester.widget<WalletPasscodeInputCard>(
      find.byType(WalletPasscodeInputCard),
    );
    expect(card.filledCount, 2);
  });

  testWidgets('SettingsPasscodeScreen back key removes last digit', (
    tester,
  ) async {
    await pumpPasscodeScreen(tester);

    await tester.tap(find.text('4'));
    await tester.pump();
    await tester.tap(find.text('5'));
    await tester.pump();

    final backKey = find.byWidgetPredicate(
      (widget) => widget is WalletPasscodeKey && widget.isBack,
    );
    await tester.tap(backKey);
    await tester.pump();

    final card = tester.widget<WalletPasscodeInputCard>(
      find.byType(WalletPasscodeInputCard),
    );
    expect(card.filledCount, 1);
  });
}
