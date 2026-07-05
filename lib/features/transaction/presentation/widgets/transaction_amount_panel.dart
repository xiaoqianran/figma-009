import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/shared/widgets/buttons/wallet_primary_button.dart';
import 'package:flutter/material.dart';

/// Shared amount entry panel for Send/Buy/Receive detail screens.
class TransactionAmountPanel extends StatefulWidget {
  const TransactionAmountPanel({
    required this.totalLabel,
    required this.estimateLabel,
    required this.confirmLabel,
    required this.onConfirm,
    this.quickAmounts = const ['50', '100', '150', '200'],
    super.key,
  });

  final String totalLabel;
  final String estimateLabel;
  final String confirmLabel;
  final VoidCallback onConfirm;
  final List<String> quickAmounts;

  @override
  State<TransactionAmountPanel> createState() => _TransactionAmountPanelState();
}

class _TransactionAmountPanelState extends State<TransactionAmountPanel> {
  String _amount = '0';

  void _appendDigit(String digit) {
    setState(() {
      if (_amount == '0' && digit != '.') {
        _amount = digit;
        return;
      }
      if (digit == '.' && _amount.contains('.')) {
        return;
      }
      _amount += digit;
    });
  }

  void _backspace() {
    setState(() {
      if (_amount.length <= 1) {
        _amount = '0';
        return;
      }
      _amount = _amount.substring(0, _amount.length - 1);
    });
  }

  void _setQuickAmount(String value) {
    setState(() => _amount = value);
  }

  @override
  Widget build(BuildContext context) {
    final displayStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 48,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    );
    final estimateStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 16, color: AppColors.gray);
    final keyStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final chipStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );

    return Column(
      children: [
        Text(widget.totalLabel, style: displayStyle),
        const SizedBox(height: DesignConstants.spacing8),
        Text(widget.estimateLabel, style: estimateStyle),
        const SizedBox(height: DesignConstants.spacing24),
        _Keypad(
          keyStyle: keyStyle,
          onDigit: _appendDigit,
          onBackspace: _backspace,
        ),
        const SizedBox(height: DesignConstants.spacing16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widget.quickAmounts
              .map(
                (value) => _QuickAmountChip(
                  label: r'$' + value,
                  style: chipStyle,
                  onTap: () => _setQuickAmount(value),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: DesignConstants.spacing24),
        WalletPrimaryButton(
          label: widget.confirmLabel,
          onPressed: widget.onConfirm,
        ),
      ],
    );
  }
}

class _Keypad extends StatelessWidget {
  const _Keypad({
    required this.keyStyle,
    required this.onDigit,
    required this.onBackspace,
  });

  final TextStyle? keyStyle;
  final ValueChanged<String> onDigit;
  final VoidCallback onBackspace;

  static const _rows = [
    ['1', '4', '7'],
    ['2', '5', '8'],
    ['3', '6', '9'],
    ['.', '0', '⌫'],
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _rows
          .map(
            (column) => Column(
              children: column
                  .map(
                    (key) => _KeyButton(
                      label: key,
                      style: keyStyle,
                      onTap: key == '⌫' ? onBackspace : () => onDigit(key),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

class _KeyButton extends StatelessWidget {
  const _KeyButton({
    required this.label,
    required this.style,
    required this.onTap,
  });

  final String label;
  final TextStyle? style;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 56,
      child: TextButton(
        onPressed: onTap,
        child: Text(label, style: style),
      ),
    );
  }
}

class _QuickAmountChip extends StatelessWidget {
  const _QuickAmountChip({
    required this.label,
    required this.style,
    required this.onTap,
  });

  final String label;
  final TextStyle? style;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: DesignConstants.spacing16,
          vertical: DesignConstants.spacing8,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF212121)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: style),
      ),
    );
  }
}
