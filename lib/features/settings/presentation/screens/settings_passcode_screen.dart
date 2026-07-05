import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/bars/wallet_navigation_bar.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_passcode_key.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_slide_confirm.dart';
import 'package:figma_009/shared/widgets/other/wallet_passcode_indicator.dart';
import 'package:figma_009/shared/widgets/other/wallet_passcode_input_card.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Figma frame `Settings - Security - Passcode` (0:488).
class SettingsPasscodeScreen extends StatefulWidget {
  const SettingsPasscodeScreen({super.key});

  @override
  State<SettingsPasscodeScreen> createState() => _SettingsPasscodeScreenState();
}

class _SettingsPasscodeScreenState extends State<SettingsPasscodeScreen> {
  String _pin = '';

  bool get _isComplete => _pin.length == WalletPasscodeIndicator.pinLength;

  void _onKeyPressed(String key) {
    setState(() {
      if (key == 'back') {
        if (_pin.isNotEmpty) {
          _pin = _pin.substring(0, _pin.length - 1);
        }
        return;
      }
      if (_pin.length < WalletPasscodeIndicator.pinLength) {
        _pin += key;
      }
    });
  }

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
            const WalletSectionTitle(
              title: 'Passcode',
              textAlign: TextAlign.center,
              underlineWidth: 180,
            ),
            const SizedBox(height: DesignConstants.spacing32),
            WalletPasscodeInputCard(filledCount: _pin.length),
            const SizedBox(height: DesignConstants.spacing24),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  bottom: DesignConstants.spacing16,
                ),
                child: WalletPasscodeKeypad(onKeyPressed: _onKeyPressed),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                DesignConstants.spacing20,
                DesignConstants.spacing16,
                DesignConstants.spacing20,
                DesignConstants.spacing20,
              ),
              child: Opacity(
                opacity: _isComplete ? 1 : 0.4,
                child: IgnorePointer(
                  ignoring: !_isComplete,
                  child: WalletSlideConfirm(
                    label: 'Slide to Save',
                    onConfirmed: () => context.pop(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
