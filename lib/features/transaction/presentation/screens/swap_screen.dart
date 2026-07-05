import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/transaction/presentation/widgets/swap_token_card.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_primary_button.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';

/// Figma frame `Swap` (0:445).
class SwapScreen extends StatelessWidget {
  const SwapScreen({super.key});

  static const _sendToken = SwapTokenData(
    label: 'You Send',
    name: 'Bitcoin',
    amount: '0.00',
    balance: 'Balance : 1 BTC',
    rate: r'1 BTC = $34,377.08',
    iconAsset: WalletAssets.coinBitcoin,
  );

  static const _receiveToken = SwapTokenData(
    label: 'You Get',
    name: 'Ripple',
    amount: '0.00',
    balance: 'Balance : 100 XRP',
    rate: r'1 XRP = $0.652',
    iconAsset: WalletAssets.coinRipple,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignConstants.spacing16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'Swap',
                textAlign: TextAlign.center,
                underlineWidth: 120,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing32),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                child: Column(
                  children: [
                    const SwapTokenCard(token: _sendToken),
                    const SizedBox(height: DesignConstants.spacing16),
                    Container(
                      width: DesignConstants.buttonHeight48,
                      height: DesignConstants.buttonHeight48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFF212121)),
                      ),
                      child: const Icon(
                        Icons.swap_vert,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: DesignConstants.spacing16),
                    const SwapTokenCard(token: _receiveToken),
                    const SizedBox(height: DesignConstants.spacing32),
                    WalletPrimaryButton(label: 'Swap', onPressed: () {}),
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
