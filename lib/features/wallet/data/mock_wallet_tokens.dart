import 'package:flutter/material.dart';

class WalletToken {
  const WalletToken({
    required this.id,
    required this.name,
    required this.symbol,
    required this.amount,
    required this.fiatValue,
    required this.changePercent,
    required this.isUp,
    required this.iconColor,
  });

  final String id;
  final String name;
  final String symbol;
  final String amount;
  final String fiatValue;
  final String changePercent;
  final bool isUp;
  final Color iconColor;
}

abstract final class MockWalletTokens {
  static const List<WalletToken> items = [
    WalletToken(
      id: 'btc',
      name: 'Bitcoin',
      symbol: 'BTC',
      amount: '0.465 BTC',
      fiatValue: '\$ 15,950.26',
      changePercent: '+1.68%',
      isUp: true,
      iconColor: Color(0xFFB0C7FF),
    ),
    WalletToken(
      id: 'eth',
      name: 'Ethereum',
      symbol: 'ETH',
      amount: '2.45 ETH',
      fiatValue: '\$ 5,260.04',
      changePercent: '+3.48%',
      isUp: true,
      iconColor: Color(0xFFFFBABA),
    ),
    WalletToken(
      id: 'pec',
      name: 'Peercoin',
      symbol: 'PEC',
      amount: '1259 PEC',
      fiatValue: '\$ 320.00',
      changePercent: '-5.55%',
      isUp: false,
      iconColor: Color(0xFFB8FF00),
    ),
    WalletToken(
      id: 'dah',
      name: 'Dash',
      symbol: 'DAH',
      amount: '112 DAH',
      fiatValue: '\$ 1,540.50',
      changePercent: '+4.67%',
      isUp: true,
      iconColor: Color(0xFFB0C7FF),
    ),
  ];

  static const String walletLabel = 'Wallet Etherium';
  static const String totalBalance = '\$ 24,306';
}
