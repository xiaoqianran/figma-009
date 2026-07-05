import 'package:figma_009/app.dart';
import 'package:figma_009/shared/widgets/other/gradient_title_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('Wallet app renders splash title', (tester) async {
    await tester.pumpWidget(WalletApp());
    await tester.pump();

    expect(find.byType(GradientTitleText), findsOneWidget);
  });
}
