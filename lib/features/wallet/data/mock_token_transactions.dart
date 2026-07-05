import 'package:figma_009/shared/widgets/cells/wallet_notification_cell.dart';

abstract final class MockTokenTransactions {
  static const List<WalletNotification> rippleHistory = [
    WalletNotification(
      type: 'Send',
      from: 'From 0x4200c90',
      amount: '320 XRP',
      usdValue: r'$208.856 USD',
    ),
    WalletNotification(
      type: 'Send',
      from: 'From 0x4200c90',
      amount: '166 XRP',
      usdValue: r'$108.196 USD',
    ),
    WalletNotification(
      type: 'Receive',
      from: 'From 0x4200c90',
      amount: '1040 XRP',
      usdValue: r'$679.04 USD',
    ),
    WalletNotification(
      type: 'Swap',
      from: 'From 0x4200c90',
      amount: r'$ 6,320 ETH',
      usdValue: r'$12.184.38 USD',
    ),
  ];

  static List<WalletNotification> forToken(String symbol) {
    return rippleHistory
        .map(
          (item) => WalletNotification(
            type: item.type,
            from: item.from,
            amount: item.amount.replaceAll('XRP', symbol),
            usdValue: item.usdValue,
          ),
        )
        .toList();
  }
}
