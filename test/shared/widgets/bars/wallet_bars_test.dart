import 'package:figma_009/shared/widgets/bars/wallet_bottom_tab_bar.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  Widget wrap(Widget child) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(body: child),
    );
  }

  group('WalletBottomTabBar', () {
    testWidgets('calls onTabSelected when tab tapped', (tester) async {
      var selected = 0;
      await tester.pumpWidget(
        wrap(
          WalletBottomTabBar(
            selectedIndex: selected,
            onTabSelected: (index) => selected = index,
            items: const [
              WalletTabItem(label: 'Wallet', icon: Icons.wallet),
              WalletTabItem(label: 'Swap', icon: Icons.swap_horiz),
            ],
          ),
        ),
      );

      await tester.tap(find.byIcon(Icons.swap_horiz));
      await tester.pump();
      expect(selected, 1);
    });
  });

  group('WalletNavigationBar', () {
    testWidgets('renders title', (tester) async {
      await tester.pumpWidget(wrap(const WalletNavigationBar(title: 'Label')));

      expect(find.text('Label'), findsOneWidget);
    });
  });
}
