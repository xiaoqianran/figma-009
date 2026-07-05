import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma passcode dots — 6× (18×12, radius 6.25) in `Settings - Passcode` (0:494).
class WalletPasscodeIndicator extends StatelessWidget {
  const WalletPasscodeIndicator({
    required this.filledCount,
    this.length = pinLength,
    super.key,
  });

  static const int pinLength = 6;

  static const double dotWidth = 18;
  static const double dotHeight = 12;
  static const double dotRadius = 6.25;
  static const double dotSpacing = 12;

  final int filledCount;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var index = 0; index < length; index++) ...[
          if (index > 0) const SizedBox(width: dotSpacing),
          _PasscodeDot(filled: index < filledCount),
        ],
      ],
    );
  }
}

class _PasscodeDot extends StatelessWidget {
  const _PasscodeDot({required this.filled});

  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: WalletPasscodeIndicator.dotWidth,
      height: WalletPasscodeIndicator.dotHeight,
      decoration: BoxDecoration(
        color: filled ? AppColors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(WalletPasscodeIndicator.dotRadius),
        border: Border.all(color: const Color(0x0C000000)),
      ),
    );
  }
}
