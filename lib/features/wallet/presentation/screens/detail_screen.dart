import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/wallet/data/mock_token_transactions.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:figma_009/features/wallet/presentation/widgets/wallet_token_balance_card.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_notification_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Detail` (0:135).
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters['id'];
    final token =
        MockWalletTokens.byId(id ?? '') ?? MockWalletTokens.items.first;
    final history = MockTokenTransactions.forToken(token.symbol);

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            WalletNavigationBar(
              title: '',
              leading: WalletNavigationBarActions.back(
                onPressed: () => context.pop(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: token.name,
                textAlign: TextAlign.center,
                underlineWidth: 168,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing16),
            WalletTokenBalanceCard(token: token),
            const SizedBox(height: DesignConstants.spacing16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return WalletNotificationCell(notification: history[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
