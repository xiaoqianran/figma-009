import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';

/// Market listing tokens for Buy flow (Figma frame `Buy` 0:196).
abstract final class MockMarketTokens {
  static const List<WalletToken> items = [
    WalletToken(
      id: 'btc',
      name: 'Bitcoin',
      symbol: 'BTC',
      amount: 'BTC',
      fiatValue: r'$ 15,950.26',
      changePercent: '+1.68%',
      isUp: true,
      iconAsset: WalletAssets.coinBitcoin,
    ),
    WalletToken(
      id: 'eth',
      name: 'Ethereum',
      symbol: 'ETH',
      amount: 'ETH',
      fiatValue: r'$ 5,260.04',
      changePercent: '+3.48%',
      isUp: true,
      iconAsset: WalletAssets.coinEther,
    ),
    WalletToken(
      id: 'dah',
      name: 'Dash',
      symbol: 'DAH',
      amount: 'DAH',
      fiatValue: r'$ 1,540.50',
      changePercent: '+4.67%',
      isUp: true,
      iconAsset: WalletAssets.coinDash,
    ),
    WalletToken(
      id: 'pec',
      name: 'Peercoin',
      symbol: 'PEC',
      amount: 'PEC',
      fiatValue: r'$ 320.00',
      changePercent: '-5.55%',
      isUp: false,
      iconAsset: WalletAssets.coinPeercoin,
    ),
    WalletToken(
      id: 'wav',
      name: 'Wave',
      symbol: 'WAV',
      amount: 'WAV',
      fiatValue: r'$ 220.00',
      changePercent: '-2.66%',
      isUp: false,
      iconAsset: WalletAssets.coinWave,
    ),
  ];
}
