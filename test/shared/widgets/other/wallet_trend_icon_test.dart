import 'package:figma_009/shared/widgets/other/wallet_trend_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('WalletTrendIcon renders for up and down', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Row(
            children: [
              WalletTrendIcon(isUp: true),
              WalletTrendIcon(isUp: false),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(WalletTrendIcon), findsNWidgets(2));
  });
}
