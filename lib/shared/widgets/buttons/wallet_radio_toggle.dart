import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Button / Check / Ration` (selected) and `Uncheck` (unselected).
class WalletRadioToggle extends StatelessWidget {
  const WalletRadioToggle({required this.selected, super.key});

  final bool selected;

  static const double width = 56;
  static const double height = 40;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          color: AppColors.blurOverlay,
          border: Border.all(color: AppColors.strokeMuted),
        ),
        child: selected
            ? Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 35,
                  height: 22,
                  margin: const EdgeInsets.only(left: 11),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0x0C000000)),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
