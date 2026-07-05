import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_token_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Send` (0:206).
class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              trailing: WalletNavigationBarActions.search(
                onPressed: () => context.push(AppRoutes.addToken),
              ),
            ),
            const SizedBox(height: DesignConstants.spacing16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'My Coin',
                textAlign: TextAlign.center,
                underlineWidth: 168,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing32),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                itemCount: MockWalletTokens.items.length,
                itemBuilder: (context, index) {
                  final token = MockWalletTokens.items[index];
                  return WalletTokenCell(
                    token: token,
                    onTap: () =>
                        context.push(AppRoutes.sendDetail, extra: token),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
