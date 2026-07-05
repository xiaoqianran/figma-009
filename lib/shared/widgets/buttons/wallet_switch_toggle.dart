import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:flutter/material.dart';

/// Figma `Button / Check / Switch / On|Off` — image-based toggle.
class WalletSwitchToggle extends StatelessWidget {
  const WalletSwitchToggle({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  static const double _width = 56;
  static const double _height = 40;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      toggled: value,
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(_height / 2),
        child: Image.asset(
          value ? WalletAssets.switchOn : WalletAssets.switchOff,
          width: _width,
          height: _height,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
