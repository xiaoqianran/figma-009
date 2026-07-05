import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/transaction/presentation/widgets/transaction_amount_panel.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Buy - Detail` (0:340).
class BuyDetailScreen extends StatelessWidget {
  const BuyDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = GoRouterState.of(context).extra as WalletToken?;
    final symbol = token?.symbol ?? 'ETH';

    final providerStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final providerSubtitleStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 12, color: AppColors.gray);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            WalletNavigationBar(
              title: 'Buy',
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
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(DesignConstants.spacing20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF212121)),
                        borderRadius: BorderRadius.circular(
                          DesignConstants.spacing16,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: DesignConstants.iconSize56,
                            height: DesignConstants.iconSize56,
                            decoration: BoxDecoration(
                              color: const Color(0xFF212121),
                              borderRadius: BorderRadius.circular(
                                DesignConstants.spacing16,
                              ),
                            ),
                            child: const Icon(
                              Icons.credit_card,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(width: DesignConstants.spacing16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('MoonPay', style: providerStyle),
                                const SizedBox(
                                  height: DesignConstants.spacing4,
                                ),
                                Text(
                                  'Third Party Provider',
                                  style: providerSubtitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: DesignConstants.spacing32),
                    TransactionAmountPanel(
                      totalLabel: r'$ 24,306',
                      estimateLabel: 'Estimated 0.0223$symbol',
                      confirmLabel: 'Slide to Swap',
                      onConfirm: () => context.pop(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
