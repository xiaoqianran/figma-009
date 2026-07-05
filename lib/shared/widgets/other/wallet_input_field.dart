import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Other / Input` — labeled field with floating tag.
class WalletInputField extends StatelessWidget {
  const WalletInputField({
    required this.label,
    required this.value,
    super.key,
    this.hint,
    this.onChanged,
    this.maxLines = 1,
    this.minHeight = 80,
  });

  final String label;
  final String value;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final int maxLines;
  final double minHeight;

  @override
  Widget build(BuildContext context) {
    final valueStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.black,
    );

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: minHeight),
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.fromLTRB(
            DesignConstants.spacing20,
            DesignConstants.spacing32,
            DesignConstants.spacing20,
            DesignConstants.spacing20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(DesignConstants.cornerRadiusMd),
            border: Border.all(color: AppColors.strokeDark),
          ),
          child: onChanged != null
              ? TextField(
                  controller: TextEditingController(text: value)
                    ..selection = TextSelection.collapsed(offset: value.length),
                  onChanged: onChanged,
                  maxLines: maxLines,
                  style: valueStyle,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                )
              : Text(
                  value.isEmpty ? (hint ?? '') : value,
                  style: valueStyle,
                  textAlign: TextAlign.center,
                ),
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
    );
  }
}
