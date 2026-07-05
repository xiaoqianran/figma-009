import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma `Bar / Bottom / Tab Bar` — 4-tab bottom navigation.
class WalletBottomTabBar extends StatelessWidget {
  const WalletBottomTabBar({
    required this.selectedIndex,
    required this.onTabSelected,
    required this.items,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final List<WalletTabItem> items;

  static const double _activeTabHeight = 53.33;
  static const double _activeCornerRadius = 24;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DesignConstants.bottomTabBarHeight,
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: DesignConstants.spacing20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < items.length; i++)
            _TabSlot(
              item: items[i],
              isActive: i == selectedIndex,
              onTap: () => onTabSelected(i),
            ),
        ],
      ),
    );
  }
}

class WalletTabItem {
  const WalletTabItem({required this.label, required this.iconAsset});

  final String label;
  final String iconAsset;
}

class _TabSlot extends StatelessWidget {
  const _TabSlot({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final WalletTabItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: item.label,
      selected: isActive,
      child: SizedBox(
        key: ValueKey('tab-${item.label}'),
        width: DesignConstants.bottomTabItemWidth,
        height: DesignConstants.bottomTabBarHeight,
        child: Center(
          child: SizedBox(
            height: WalletBottomTabBar._activeTabHeight,
            width: DesignConstants.bottomTabItemWidth,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(
                  WalletBottomTabBar._activeCornerRadius,
                ),
                child: Ink(
                  decoration: isActive
                      ? BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            WalletBottomTabBar._activeCornerRadius,
                          ),
                          border: Border.all(color: AppColors.strokeDark),
                        )
                      : null,
                  child: Center(
                    child: Image.asset(
                      item.iconAsset,
                      width: DesignConstants.iconSize32,
                      height: DesignConstants.iconSize32,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
