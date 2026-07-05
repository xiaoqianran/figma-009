import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/settings/data/wallet_settings_state.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/cells/wallet_selection_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Security - AutoLock` (0:534).
class SettingsAutoLockScreen extends StatefulWidget {
  const SettingsAutoLockScreen({super.key});

  @override
  State<SettingsAutoLockScreen> createState() => _SettingsAutoLockScreenState();
}

class _SettingsAutoLockScreenState extends State<SettingsAutoLockScreen> {
  final WalletSettingsState _settings = WalletSettingsState.instance;

  @override
  void initState() {
    super.initState();
    _settings.addListener(_onSettingsChanged);
  }

  @override
  void dispose() {
    _settings.removeListener(_onSettingsChanged);
    super.dispose();
  }

  void _onSettingsChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            WalletNavigationBar(
              title: '',
              leading: WalletNavigationBarActions.back(
                onPressed: () => context.pop(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'Auto-Lock',
                textAlign: TextAlign.center,
                underlineWidth: 200,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing16),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                itemCount: WalletSettingsState.autoLockOptions.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(height: DesignConstants.spacing12),
                itemBuilder: (context, index) {
                  final option = WalletSettingsState.autoLockOptions[index];
                  return WalletSelectionCell(
                    title: option,
                    selected: _settings.autoLockIndex == index,
                    showDivider:
                        index < WalletSettingsState.autoLockOptions.length - 1,
                    onTap: () => _settings.setAutoLock(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
