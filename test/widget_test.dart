import 'package:figma_009/app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('Wallet app renders splash placeholder', (tester) async {
    await tester.pumpWidget(WalletApp());
    await tester.pumpAndSettle();

    expect(find.text('Splash screen'), findsOneWidget);
  });
}