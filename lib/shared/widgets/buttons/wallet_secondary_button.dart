import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Button / Secondary` — blurred pill with white label.
class WalletSecondaryButton extends StatelessWidget {
  const WalletSecondaryButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;

  static const double _height = 80;
  static const double _cornerRadius = 40;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
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
              color: AppColors.blurOverlay,
              border: Border.all(color: const Color(0xFF1F1F1F)),
            ),
            child: Center(child: Text(label, style: textStyle)),
          ),
        ),
      ),
    );
  }
}
