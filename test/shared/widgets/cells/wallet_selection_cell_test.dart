import 'package:figma_009/shared/widgets/buttons/wallet_radio_toggle.dart';
import 'package:figma_009/shared/widgets/cells/wallet_selection_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('WalletSelectionCell shows title and radio state', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WalletSelectionCell(
            title: 'Immediate',
            selected: true,
            onTap: () {},
          ),
        ),
      ),
    );

    expect(find.text('Immediate'), findsOneWidget);
    expect(find.byType(WalletRadioToggle), findsOneWidget);
  });

  testWidgets('WalletSelectionCell calls onTap', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: WalletSelectionCell(
            title: 'Passcode',
            selected: false,
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    await tester.tap(find.text('Passcode'));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
