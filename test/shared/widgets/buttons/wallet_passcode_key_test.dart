import 'package:figma_009/shared/widgets/buttons/wallet_passcode_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('WalletPasscodeKeypad renders digit keys', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: WalletPasscodeKeypad())),
    );

    expect(find.text('1'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.byType(WalletPasscodeKey), findsNWidgets(11));
  });

  testWidgets('WalletPasscodeKeypad reports key presses', (tester) async {
    final pressed = <String>[];

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(body: WalletPasscodeKeypad(onKeyPressed: pressed.add)),
      ),
    );

    await tester.tap(find.text('5'));
    await tester.pump();

    expect(pressed, ['5']);
  });
}
