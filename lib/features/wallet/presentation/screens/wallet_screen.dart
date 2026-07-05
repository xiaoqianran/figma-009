import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:figma_009/features/wallet/presentation/widgets/wallet_balance_card.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_token_cell.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Wallet` (0:2).
class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            WalletNavigationBar(
              title: 'My Wallet',
              trailing: WalletNavigationBarActions.search(
                onPressed: () => context.push(AppRoutes.addToken),
              ),
            ),
            GestureDetector(
              onTap: () => context.push(AppRoutes.walletScroll),
              child: const WalletBalanceCard(),
            ),
            const SizedBox(height: DesignConstants.spacing16),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.black,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.fromLTRB(
                    DesignConstants.spacing20,
                    DesignConstants.spacing16,
                    DesignConstants.spacing20,
                    DesignConstants.spacing16,
                  ),
                  itemCount: MockWalletTokens.items.length,
                  itemBuilder: (context, index) {
                    final token = MockWalletTokens.items[index];
                    return WalletTokenCell(
                      token: token,
                      onTap: () =>
                          context.push('${AppRoutes.detail}/${token.id}'),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
