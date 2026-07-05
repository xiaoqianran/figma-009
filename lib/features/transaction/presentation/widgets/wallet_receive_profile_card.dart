import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Figma Receive profile card with name and wallet address.
class WalletReceiveProfileCard extends StatelessWidget {
  const WalletReceiveProfileCard({
    required this.name,
    required this.address,
    super.key,
  });

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    final nameStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
    final addressStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColors.gray,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(DesignConstants.spacing20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF212121)),
        borderRadius: BorderRadius.circular(DesignConstants.spacing16),
      ),
      child: Row(
        children: [
          Container(
            width: DesignConstants.iconSize56,
            height: DesignConstants.iconSize56,
            decoration: BoxDecoration(
              gradient: AppColors.titleGradient,
              borderRadius: BorderRadius.circular(
                DesignConstants.iconSize56 / 2,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              name.isNotEmpty ? name[0].toUpperCase() : '?',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ),
          const SizedBox(width: DesignConstants.spacing16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: nameStyle),
                const SizedBox(height: DesignConstants.spacing4),
                Text(address, style: addressStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
