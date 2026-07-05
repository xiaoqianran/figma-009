import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/transaction/presentation/widgets/wallet_receive_profile_card.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Scan` (0:328).
class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  static const _walletName = 'Freddy';
  static const _walletAddress = 'an21vnvnvok2vvaxm396';

  @override
  Widget build(BuildContext context) {
    final hintStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 14, color: AppColors.gray);

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
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'Scan',
                textAlign: TextAlign.center,
                underlineWidth: 120,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing24),
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(DesignConstants.spacing20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF212121)),
                    borderRadius: BorderRadius.circular(
                      DesignConstants.spacing16,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.all(DesignConstants.spacing20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.titleGradient.colors.first,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.qr_code_scanner,
                              size: 80,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: DesignConstants.spacing16),
                          Text(
                            'Align QR code within the frame',
                            style: hintStyle,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
