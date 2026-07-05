import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WalletNotification {
  const WalletNotification({
    required this.type,
    required this.from,
    required this.amount,
    required this.usdValue,
  });

  final String type;
  final String from;
  final String amount;
  final String usdValue;
}

/// Figma notification list cell.
class WalletNotificationCell extends StatelessWidget {
  const WalletNotificationCell({required this.notification, super.key});

  final WalletNotification notification;

  @override
  Widget build(BuildContext context) {
    final typeStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final metaStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.gray,
    );
    final amountStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DesignConstants.spacing12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notification.type, style: typeStyle),
          const SizedBox(height: DesignConstants.spacing4),
          Text(notification.from, style: metaStyle),
          const SizedBox(height: DesignConstants.spacing8),
          Row(
            children: [
              Text(notification.amount, style: amountStyle),
              const Spacer(),
              Text(notification.usdValue, style: metaStyle),
            ],
          ),
          const SizedBox(height: DesignConstants.spacing12),
          const Divider(height: 1, color: Color(0xFF1E1E1E)),
        ],
      ),
    );
  }
}
