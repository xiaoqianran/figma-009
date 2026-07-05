import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/core/theme/app_typography.dart';
import 'package:flutter/material.dart';

/// Figma `Button / Passcode / Number` — 108×72 keypad key.
class WalletPasscodeKey extends StatelessWidget {
  const WalletPasscodeKey({
    required this.label,
    required this.onPressed,
    super.key,
    this.isBack = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isBack;

  static const double keyWidth = 108;
  static const double keyHeight = 72;
  static const double _radius = 34;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: keyWidth,
      height: keyHeight,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(_radius),
          child: isBack
              ? Image.asset(
                  WalletAssets.passcodeBack,
                  width: keyWidth,
                  height: keyHeight,
                  fit: BoxFit.contain,
                )
              : Ink(
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(_radius),
                    border: Border.all(color: AppColors.strokeDark),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            fontFamily: AppTypography.clashDisplayFamily,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                          ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

/// 3×4 passcode grid matching Figma `Settings - Security - Passcode`.
class WalletPasscodeKeypad extends StatelessWidget {
  const WalletPasscodeKeypad({super.key, this.onKeyPressed});

  final ValueChanged<String>? onKeyPressed;

  static const _keys = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    '0',
    'back',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: DesignConstants.spacing32,
      ),
      mainAxisSpacing: DesignConstants.spacing16,
      crossAxisSpacing: DesignConstants.spacing16,
      childAspectRatio:
          WalletPasscodeKey.keyWidth / WalletPasscodeKey.keyHeight,
      children: [
        for (final key in _keys)
          if (key.isEmpty)
            const SizedBox.shrink()
          else if (key == 'back')
            WalletPasscodeKey(
              label: '',
              isBack: true,
              onPressed: onKeyPressed == null
                  ? null
                  : () => onKeyPressed!('back'),
            )
          else
            WalletPasscodeKey(
              label: key,
              onPressed: onKeyPressed == null ? null : () => onKeyPressed!(key),
            ),
      ],
    );
  }
}
