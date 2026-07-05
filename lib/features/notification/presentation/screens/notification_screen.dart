import 'package:figma_009/core/constants/design_constants.dart';
import 'package:figma_009/core/theme/app_colors.dart';
import 'package:figma_009/features/notification/data/mock_notifications.dart';
import 'package:figma_009/shared/widgets/cells/wallet_notification_cell.dart';
import 'package:figma_009/shared/widgets/other/wallet_section_title.dart';
import 'package:flutter/material.dart';

/// Figma frame `Notification` (0:453).
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: DesignConstants.spacing16),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignConstants.spacing20,
              ),
              child: WalletSectionTitle(
                title: 'Notification',
                textAlign: TextAlign.center,
                underlineWidth: 220,
              ),
            ),
            const SizedBox(height: DesignConstants.spacing24),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: DesignConstants.spacing20,
                ),
                itemCount: MockNotifications.items.length,
                itemBuilder: (context, index) {
                  return WalletNotificationCell(
                    notification: MockNotifications.items[index],
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
