import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/transaction/presentation/widgets/transaction_amount_panel.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Send - Detail` (0:363).
class SendDetailScreen extends StatelessWidget {
  const SendDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = GoRouterState.of(context).extra as WalletToken?;
    final symbol = token?.symbol ?? 'ETH';

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            WalletNavigationBar(
              title: 'Send',
              leading: WalletNavigationBarActions.back(
                onPressed: () => context.pop(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  DesignConstants.spacing20,
                  DesignConstants.spacing24,
                  DesignConstants.spacing20,
                  DesignConstants.spacing32,
                ),
                child: TransactionAmountPanel(
                  totalLabel: r'$ 6,405',
                  estimateLabel: 'Estimated 0.0223$symbol',
                  confirmLabel: 'Slide to Swap',
                  onConfirm: () => context.pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
