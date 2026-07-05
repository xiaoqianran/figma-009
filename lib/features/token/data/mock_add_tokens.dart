import 'package:figma_009/core/constants/wallet_assets.dart';
import 'package:figma_009/shared/widgets/cells/wallet_add_token_cell.dart';

/// Add Token list mock data (Figma frames `Add Token` / `Search`).
abstract final class MockAddTokens {
  static const List<AddTokenItem> items = [
    AddTokenItem(
      name: 'Bitcoin',
      symbol: 'BTC',
      iconAsset: WalletAssets.coinBitcoin,
    ),
    AddTokenItem(
      name: 'Ethereum',
      symbol: 'ETH',
      iconAsset: WalletAssets.coinEther,
    ),
    AddTokenItem(name: 'Wave', symbol: 'WAV', iconAsset: WalletAssets.coinWave),
    AddTokenItem(name: 'Dash', symbol: 'DAH', iconAsset: WalletAssets.coinDash),
    AddTokenItem(name: 'BNB', symbol: 'BNB', iconAsset: WalletAssets.coinBnb),
    AddTokenItem(
      name: 'Ripple',
      symbol: 'XRP',
      iconAsset: WalletAssets.coinRipple,
    ),
  ];
}
