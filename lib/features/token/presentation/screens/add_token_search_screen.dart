import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/token/data/mock_add_tokens.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_add_token_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Add Token - Search` (0:178).
class AddTokenSearchScreen extends StatefulWidget {
  const AddTokenSearchScreen({super.key});

  @override
  State<AddTokenSearchScreen> createState() => _AddTokenSearchScreenState();
}

class _AddTokenSearchScreenState extends State<AddTokenSearchScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final results = MockAddTokens.items
        .where(
          (token) =>
              token.name.toLowerCase().contains(_query.toLowerCase()) ||
              token.symbol.toLowerCase().contains(_query.toLowerCase()),
        )
        .toList();

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
              child: TextField(
                autofocus: true,
                style: const TextStyle(color: AppColors.white),
                decoration: const InputDecoration(
                  hintText: 'Search token',
                  hintStyle: TextStyle(color: AppColors.gray),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _query = value),
              ),
            ),
            const SizedBox(height: DesignConstants.spacing16),
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
            const SizedBox(height: DesignConstants.spacing8),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return WalletAddTokenCell(
                    token: results[index],
                    onTap: () => context.pop(),
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
