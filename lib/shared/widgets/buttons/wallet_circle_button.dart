import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Button / Circle / Fill` — 64px circular action button.
class WalletCircleButton extends StatelessWidget {
  const WalletCircleButton({
    required this.icon,
    required this.onPressed,
    super.key,
    this.size = 64,
  });

  final Widget icon;
  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Ink(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.gray.withValues(alpha: 0.5)),
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
