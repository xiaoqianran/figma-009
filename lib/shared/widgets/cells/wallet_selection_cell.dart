import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/core/theme/app_typography.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_radio_toggle.dart';
import 'package:flutter/material.dart';

/// Figma `Cell / Next Copy` on Auto-Lock / Lock Method screens.
class WalletSelectionCell extends StatelessWidget {
  const WalletSelectionCell({
    required this.title,
    required this.selected,
    required this.onTap,
    super.key,
    this.showDivider = true,
  });

  final String title;
  final bool selected;
  final VoidCallback onTap;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontFamily: AppTypography.clashDisplayFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(34),
        child: Ink(
          decoration: BoxDecoration(
            color: AppColors.surfaceDark,
            borderRadius: BorderRadius.circular(34),
            border: Border.all(color: AppColors.strokeDark),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              DesignConstants.spacing32,
              DesignConstants.spacing16,
              DesignConstants.spacing20,
              DesignConstants.spacing16,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text(title, style: titleStyle)),
                    WalletRadioToggle(selected: selected),
                  ],
                ),
                if (showDivider) ...[
                  const SizedBox(height: DesignConstants.spacing16),
                  const Divider(height: 1, color: Color(0xFF1E1E1E)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
