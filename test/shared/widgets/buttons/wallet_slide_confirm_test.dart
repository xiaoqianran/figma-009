import 'package:figma_009/shared/widgets/buttons/wallet_slide_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('WalletSlideConfirm renders label and thumb', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WalletSlideConfirm(label: 'Slide to Swap', onConfirmed: _noop),
        ),
      ),
    );

    expect(find.text('Slide to Swap'), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });

  testWidgets('WalletSlideConfirm triggers on full drag', (tester) async {
    var confirmed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 360,
            child: WalletSlideConfirm(
              label: 'Slide to Swap',
              onConfirmed: () => confirmed = true,
            ),
          ),
        ),
      ),
    );

    await tester.drag(find.byIcon(Icons.chevron_right), const Offset(320, 0));
    await tester.pumpAndSettle();

    expect(confirmed, isTrue);
    expect(find.byIcon(Icons.check), findsOneWidget);
  });
}

void _noop() {}
