import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Button / Primary` — pill button with inner stroke ring.
class WalletPrimaryButton extends StatelessWidget {
  const WalletPrimaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  static const double _height = 80;
  static const double _cornerRadius = 40;
  static const double _innerInset = 4;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );

    return SizedBox(
      height: _height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(_cornerRadius),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_cornerRadius),
              gradient: AppColors.titleGradient,
              border: Border.all(color: const Color(0x0C000000)),
            ),
            child: Container(
              margin: const EdgeInsets.all(_innerInset),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  _cornerRadius - _innerInset,
                ),
                border: Border.all(color: AppColors.black),
              ),
              alignment: Alignment.center,
              child: Text(label, style: textStyle),
            ),
          ),
        ),
      ),
    );
  }
}
