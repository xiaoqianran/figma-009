import 'package:flutter/material.dart';

/// Raster icon from Figma Symbols (typically 32px source).
class WalletAssetIcon extends StatelessWidget {
  const WalletAssetIcon(this.asset, {this.size = 32, this.color, super.key});

  final String asset;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final image = Image.asset(
      asset,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );

    if (color == null) {
      return image;
    }

    return ColorFiltered(
      colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
      child: image,
    );
  }
}
