import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_icon_button.dart';
import 'package:figma_009/shared/widgets/other/wallet_asset_icon.dart';
import 'package:flutter/material.dart';

/// Figma `Bar / Navigation / Label + 2 icon` — top bar with title and side actions.
class WalletNavigationBar extends StatelessWidget {
  const WalletNavigationBar({
    required this.title,
    super.key,
    this.leading,
    this.trailing,
  });

  final String title;
  final Widget? leading;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );

    return Container(
      height: DesignConstants.navigationBarHeight,
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: DesignConstants.spacing20,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(title, style: titleStyle, textAlign: TextAlign.center),
          ),
          if (leading != null)
            Align(alignment: Alignment.centerLeft, child: leading),
          if (trailing != null)
            Align(alignment: Alignment.centerRight, child: trailing),
        ],
      ),
    );
  }
}

/// Convenience factory for the common back + search navigation pattern.
class WalletNavigationBarActions {
  const WalletNavigationBarActions._();

  static Widget back({required VoidCallback onPressed}) {
    return WalletIconButton(
      key: const ValueKey('nav-back'),
      icon: const WalletAssetIcon(WalletAssets.iconBack),
      onPressed: onPressed,
    );
  }

  static Widget search({required VoidCallback onPressed}) {
    return WalletIconButton(
      icon: const WalletAssetIcon(WalletAssets.iconSearch),
      onPressed: onPressed,
    );
  }
}
