import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/shared/widgets/bars/wallet_bottom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shell matching Figma `Bar / Bottom / Tab Bar` (Wallet, Swap, Notification, Settings).
class MainShell extends StatelessWidget {
  const MainShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _tabs = <WalletTabItem>[
    WalletTabItem(label: 'Wallet', iconAsset: WalletAssets.tabWallet),
    WalletTabItem(label: 'Swap', iconAsset: WalletAssets.tabSwap),
    WalletTabItem(
      label: 'Notification',
      iconAsset: WalletAssets.tabNotification,
    ),
    WalletTabItem(label: 'Settings', iconAsset: WalletAssets.tabSettings),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: WalletBottomTabBar(
        selectedIndex: navigationShell.currentIndex,
        onTabSelected: navigationShell.goBranch,
        items: _tabs,
      ),
    );
  }
}
