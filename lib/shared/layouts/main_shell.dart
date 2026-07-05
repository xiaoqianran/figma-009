import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Shell matching Figma `Bar / Bottom / Tab Bar` (Wallet, Swap, Notification, Settings).
class MainShell extends StatelessWidget {
  const MainShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _tabs = <_TabItem>[
    _TabItem(label: 'Wallet', route: AppRoutes.wallet, icon: Icons.account_balance_wallet_outlined),
    _TabItem(label: 'Swap', route: AppRoutes.swap, icon: Icons.swap_horiz),
    _TabItem(label: 'Notification', route: AppRoutes.notification, icon: Icons.notifications_outlined),
    _TabItem(label: 'Settings', route: AppRoutes.settings, icon: Icons.settings_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SizedBox(
        height: DesignConstants.bottomTabBarHeight,
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: navigationShell.goBranch,
          destinations: [
            for (final tab in _tabs)
              NavigationDestination(icon: Icon(tab.icon), label: tab.label),
          ],
        ),
      ),
    );
  }
}

class _TabItem {
  const _TabItem({
    required this.label,
    required this.route,
    required this.icon,
  });

  final String label;
  final String route;
  final IconData icon;
}