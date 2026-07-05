import 'package:figma_009/core/constants/wallet_assets.dart';

class WalletToken {
  const WalletToken({
    required this.id,
    required this.name,
    required this.symbol,
    required this.amount,
    required this.fiatValue,
    required this.changePercent,
    required this.isUp,
    required this.iconAsset,
  });

  final String id;
  final String name;
  final String symbol;
  final String amount;
  final String fiatValue;
  final String changePercent;
  final bool isUp;
  final String iconAsset;
}

abstract final class MockWalletTokens {
  static const List<WalletToken> items = [
    WalletToken(
      id: 'btc',
      name: 'Bitcoin',
      symbol: 'BTC',
      amount: '0.465 BTC',
      fiatValue: r'$ 15,950.26',
      changePercent: '+1.68%',
      isUp: true,
      iconAsset: WalletAssets.coinBitcoin,
    ),
    WalletToken(
      id: 'eth',
      name: 'Ethereum',
      symbol: 'ETH',
      amount: '2.45 ETH',
      fiatValue: r'$ 5,260.04',
      changePercent: '+3.48%',
      isUp: true,
      iconAsset: WalletAssets.coinEther,
    ),
    WalletToken(
      id: 'pec',
      name: 'Peercoin',
      symbol: 'PEC',
      amount: '1259 PEC',
      fiatValue: r'$ 320.00',
      changePercent: '-5.55%',
      isUp: false,
      iconAsset: WalletAssets.coinPeercoin,
    ),
    WalletToken(
      id: 'dah',
      name: 'Dash',
      symbol: 'DAH',
      amount: '112 DAH',
      fiatValue: r'$ 1,540.50',
      changePercent: '+4.67%',
      isUp: true,
      iconAsset: WalletAssets.coinDash,
    ),
    WalletToken(
      id: 'wav',
      name: 'Wave',
      symbol: 'WAV',
      amount: '4015 WAV',
      fiatValue: r'$ 220.00',
      changePercent: '-2.66%',
      isUp: false,
      iconAsset: WalletAssets.coinWave,
    ),
  ];

  static const String walletLabel = 'Wallet Etherium';
  static const String totalBalance = r'$ 24,306';

  static WalletToken? byId(String id) {
    for (final token in items) {
      if (token.id == id) {
        return token;
      }
    }
    return null;
  }

  static String detailBalanceLabel(WalletToken token) => 'Wallet ${token.name}';

  static String detailBalanceValue(WalletToken token) {
    return switch (token.id) {
      'btc' => r'$ 15,950',
      'eth' => r'$ 5,260',
      'pec' => r'$ 320',
      'dah' => r'$ 1,540',
      'wav' => r'$ 220',
      _ => r'$ 4,950',
    };
  }
}
