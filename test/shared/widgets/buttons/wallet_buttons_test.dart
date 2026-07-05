import 'package:figma_009/shared/widgets/buttons/wallet_circle_button.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_icon_button.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_primary_button.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Widget wrap(Widget child) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(body: Center(child: child)),
    );
  }

  group('WalletPrimaryButton', () {
    testWidgets('renders label and handles tap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(WalletPrimaryButton(label: 'Add', onPressed: () => tapped = true)),
      );

      expect(find.text('Add'), findsOneWidget);
      await tester.tap(find.text('Add'));
      await tester.pump();
      expect(tapped, isTrue);
    });
  });

  group('WalletSecondaryButton', () {
    testWidgets('renders label and handles tap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          WalletSecondaryButton(
            label: 'Cancel',
            onPressed: () => tapped = true,
          ),
        ),
      );

      expect(find.text('Cancel'), findsOneWidget);
      await tester.tap(find.text('Cancel'));
      await tester.pump();
      expect(tapped, isTrue);
    });
  });

  group('WalletCircleButton', () {
    testWidgets('renders icon child', (tester) async {
      await tester.pumpWidget(
        wrap(
          WalletCircleButton(
            icon: const Icon(Icons.send, key: Key('send-icon')),
            onPressed: () {},
          ),
        ),
      );

      expect(find.byKey(const Key('send-icon')), findsOneWidget);
    });
  });

  group('WalletIconButton', () {
    testWidgets('renders icon child', (tester) async {
      await tester.pumpWidget(
        wrap(
          WalletIconButton(
            icon: const Icon(Icons.arrow_back, key: Key('back-icon')),
            onPressed: () {},
          ),
        ),
      );

      expect(find.byKey(const Key('back-icon')), findsOneWidget);
    });
  });
}
