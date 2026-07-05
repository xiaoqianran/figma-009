import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Button / 48px` — circular icon-only control.
class WalletIconButton extends StatelessWidget {
  const WalletIconButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: DesignConstants.buttonHeight48,
      height: DesignConstants.buttonHeight48,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Ink(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.black,
              border: Border.all(color: AppColors.strokeDark),
            ),
            child: Center(
              child: SizedBox(
                width: DesignConstants.iconSize32,
                height: DesignConstants.iconSize32,
                child: icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
