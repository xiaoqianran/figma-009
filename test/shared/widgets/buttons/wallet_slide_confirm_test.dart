import 'package:figma_009/shared/widgets/buttons/wallet_slide_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('WalletSlideConfirm renders label and thumb', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: WalletSlideConfirm(label: 'Slide to Swap', onConfirmed: _noop),
        ),
      ),
    );

    expect(find.text('Slide to Swap'), findsOneWidget);
    expect(find.byKey(const ValueKey('slide-thumb')), findsOneWidget);
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

    await tester.drag(
      find.byKey(const ValueKey('slide-thumb')),
      const Offset(320, 0),
    );
    await tester.pumpAndSettle();

    expect(confirmed, isTrue);
  });
}

void _noop() {}
