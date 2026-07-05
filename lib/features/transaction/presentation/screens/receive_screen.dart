import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/transaction/presentation/widgets/wallet_receive_profile_card.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_circle_button.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Receive` (0:215).
class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  static const _walletName = 'Freddy';
  static const _walletAddress = 'an21vnvnvok2vvaxm396';

  @override
  Widget build(BuildContext context) {
    final actionStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );

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
            const SizedBox(height: DesignConstants.spacing16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'Receive',
                textAlign: TextAlign.center,
                underlineWidth: 168,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing32),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: const WalletReceiveProfileCard(
                name: _walletName,
                address: _walletAddress,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing32),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ReceiveAction(
                    label: 'Buy',
                    icon: const Icon(Icons.add, color: AppColors.black),
                    labelStyle: actionStyle,
                    onPressed: () => context.push(AppRoutes.buy),
                  ),
                  _ReceiveAction(
                    label: 'Set Amount',
                    icon: const Icon(Icons.edit, color: AppColors.black),
                    labelStyle: actionStyle,
                    onPressed: () => context.push(AppRoutes.receiveDetail),
                  ),
                  _ReceiveAction(
                    label: 'Share',
                    icon: const Icon(Icons.share, color: AppColors.black),
                    labelStyle: actionStyle,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _ReceiveAction extends StatelessWidget {
  const _ReceiveAction({
    required this.label,
    required this.icon,
    required this.labelStyle,
    required this.onPressed,
  });

  final String label;
  final Widget icon;
  final TextStyle? labelStyle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WalletCircleButton(icon: icon, onPressed: onPressed),
        const SizedBox(height: DesignConstants.spacing8),
        Text(label, style: labelStyle),
      ],
    );
  }
}
