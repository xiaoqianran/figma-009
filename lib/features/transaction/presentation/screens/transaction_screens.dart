export 'buy_detail_screen.dart';
export 'buy_screen.dart';
export 'receive_detail_screen.dart';
export 'receive_screen.dart';
export 'send_detail_screen.dart';
export 'send_screen.dart';

import 'package:figma_009/shared/widgets/figma_placeholder_screen.dart';
import 'package:flutter/material.dart';

class SwapScreen extends StatelessWidget {
  const SwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FigmaPlaceholderScreen(figmaFrame: 'Swap');
  }
}
