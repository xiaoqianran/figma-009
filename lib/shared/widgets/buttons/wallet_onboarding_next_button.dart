import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma Onboarding frame — 88px circular next control (back icon mirrored).
class WalletOnboardingNextButton extends StatelessWidget {
  const WalletOnboardingNextButton({required this.onPressed, super.key});

  final VoidCallback? onPressed;

  static const double size = 88;
  static const double innerSize = 80;

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
              border: Border.all(color: const Color(0x0C000000)),
            ),
            child: Center(
              child: Container(
                width: innerSize,
                height: innerSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.black, width: 2),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
