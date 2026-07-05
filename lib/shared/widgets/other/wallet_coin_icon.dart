import 'package:figma_009/core/constants/design_constants.dart';
import 'package:flutter/material.dart';

/// Figma `Icon / 56px / Coin/*` token avatar.
class WalletCoinIcon extends StatelessWidget {
  const WalletCoinIcon({
    required this.asset,
    this.size = DesignConstants.iconSize56,
    super.key,
  });

  final String asset;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(DesignConstants.spacing16),
      child: Image.asset(asset, width: size, height: size, fit: BoxFit.cover),
    );
  }
}
