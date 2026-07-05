import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/token/data/mock_add_tokens.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_add_token_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Add Token` (0:157).
class AddTokenScreen extends StatelessWidget {
  const AddTokenScreen({super.key});

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
                onPressed: () => context.push(AppRoutes.addTokenSearch),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'Add Token',
                textAlign: TextAlign.center,
                underlineWidth: 200,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing16),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                itemCount: MockAddTokens.items.length,
                itemBuilder: (context, index) {
                  final token = MockAddTokens.items[index];
                  return WalletAddTokenCell(
                    token: token,
                    onTap: () => context.pop(),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(DesignConstants.spacing20),
              child: TextButton(
                onPressed: () => context.push(AppRoutes.customToken),
                child: const Text('Add Custom Token'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
