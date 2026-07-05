import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SwapTokenData {
  const SwapTokenData({
    required this.label,
    required this.name,
    required this.amount,
    required this.balance,
    required this.rate,
    required this.iconColor,
  });

  final String label;
  final String name;
  final String amount;
  final String balance;
  final String rate;
  final Color iconColor;
}

/// Figma Swap card — You Send / You Get token panel.
class SwapTokenCard extends StatelessWidget {
  const SwapTokenCard({required this.token, super.key});

  final SwapTokenData token;

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.gray,
    );
    final amountStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
      fontSize: 32,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final nameStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final metaStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(fontSize: 14, color: AppColors.gray);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignConstants.spacing20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF212121)),
        borderRadius: BorderRadius.circular(DesignConstants.spacing16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(token.label, style: labelStyle),
          const SizedBox(height: DesignConstants.spacing8),
          Text(token.amount, style: amountStyle),
          const SizedBox(height: DesignConstants.spacing12),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: token.iconColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  token.name[0],
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              const SizedBox(width: DesignConstants.spacing12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(token.name, style: nameStyle),
                    Text(token.rate, style: metaStyle),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: DesignConstants.spacing8),
          Text(token.balance, style: metaStyle),
        ],
      ),
    );
  }
}
