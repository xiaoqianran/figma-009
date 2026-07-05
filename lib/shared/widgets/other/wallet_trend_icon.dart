import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/other/wallet_asset_icon.dart';
import 'package:flutter/material.dart';

/// Figma `Icon / 24px / Arrow` trend indicator for token cells.
class WalletTrendIcon extends StatelessWidget {
  const WalletTrendIcon({required this.isUp, super.key});

  final bool isUp;

  static const double _rotationUp = -0.785398; // -45°
  static const double _rotationDown = 2.356194; // 135°

  @override
  Widget build(BuildContext context) {
    final color = isUp
        ? AppColors.titleGradient.colors.first
        : AppColors.pinkGradient.colors.last;

    return Transform.rotate(
      angle: isUp ? _rotationUp : _rotationDown,
      child: WalletAssetIcon(
        WalletAssets.iconArrow,
        size: DesignConstants.iconSize24,
        color: color,
      ),
    );
  }
}
