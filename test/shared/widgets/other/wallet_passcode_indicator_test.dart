import 'package:figma_009/shared/widgets/other/wallet_passcode_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('WalletPasscodeIndicator renders six dots', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: WalletPasscodeIndicator(filledCount: 0)),
      ),
    );

    expect(find.byType(WalletPasscodeIndicator), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(WalletPasscodeIndicator),
        matching: find.byType(Container),
      ),
      findsNWidgets(6),
    );
  });

  testWidgets('WalletPasscodeIndicator reflects filled count', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: WalletPasscodeIndicator(filledCount: 3)),
      ),
    );

    final containers = tester.widgetList<Container>(
      find.descendant(
        of: find.byType(WalletPasscodeIndicator),
        matching: find.byType(Container),
      ),
    );

    final filledDots = containers
        .where(
          (container) =>
              container.decoration is BoxDecoration &&
              (container.decoration! as BoxDecoration).color !=
                  Colors.transparent,
        )
        .length;

    expect(filledDots, 3);
  });
}
