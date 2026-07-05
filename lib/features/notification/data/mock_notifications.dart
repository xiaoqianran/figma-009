import 'package:figma_009/shared/widgets/cells/wallet_notification_cell.dart';

abstract final class MockNotifications {
  static const List<WalletNotification> items = [
    WalletNotification(
      type: 'Send',
      from: 'From 0x4200c90',
      amount: r'$ 1,320 ETH',
      usdValue: r'$ 15,950.26 USD',
    ),
    WalletNotification(
      type: 'Send',
      from: 'From 0x4200c90',
      amount: r'$ 320 ETH',
      usdValue: r'$ 5,260.04 USD',
    ),
    WalletNotification(
      type: 'Receive',
      from: 'From 0x4200c90',
      amount: r'$ 3320 XRP',
      usdValue: r'$ 250.40 USD',
    ),
    WalletNotification(
      type: 'Swap',
      from: 'From 0x4200c90',
      amount: r'$ 1320 ETH',
      usdValue: r'$ 550.40 USD',
    ),
  ];
}
