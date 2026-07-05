import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Splash title from Figma — gradient fill with black stroke outline.
class GradientTitleText extends StatelessWidget {
  const GradientTitleText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: DesignConstants.splashTitleFontSize,
      fontWeight: FontWeight.w600,
      height: 1.2,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        Text(
          text,
          textAlign: TextAlign.center,
          style: baseStyle?.copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = AppColors.black,
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) =>
              AppColors.titleGradient.createShader(bounds),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: baseStyle?.copyWith(color: AppColors.white),
          ),
        ),
      ],
    );
  }
}
