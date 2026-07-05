import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/core/theme/app_typography.dart';
import 'package:figma_009/shared/widgets/other/wallet_passcode_indicator.dart';
import 'package:flutter/material.dart';

/// Figma `Other / Input` on `Settings - Security - Passcode` (0:493).
class WalletPasscodeInputCard extends StatelessWidget {
  const WalletPasscodeInputCard({
    required this.filledCount,
    this.label = 'Enter your passcode',
    super.key,
  });

  final int filledCount;
  final String label;

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontFamily: AppTypography.clashDisplayFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: DesignConstants.spacing20,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: 96,
            margin: const EdgeInsets.only(top: 16),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: AppColors.strokeDark),
            ),
            alignment: Alignment.center,
            child: WalletPasscodeIndicator(filledCount: filledCount),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignConstants.spacing16,
              vertical: DesignConstants.spacing8,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(DesignConstants.spacing16),
              border: Border.all(color: const Color(0x0C000000)),
            ),
            child: Text(label, style: labelStyle),
          ),
        ],
      ),
    );
  }
}
