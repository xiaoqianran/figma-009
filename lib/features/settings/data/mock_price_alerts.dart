import 'package:figma_009/features/wallet/data/mock_wallet_tokens.dart';

/// Price Alerts tokens (Figma frames `0:586` / `0:600`).
abstract final class MockPriceAlerts {
  static final List<WalletToken> tokens = [
    MockWalletTokens.byId('btc')!,
    MockWalletTokens.byId('eth')!,
    MockWalletTokens.byId('dah')!,
    MockWalletTokens.byId('pec')!,
  ];

  static const List<bool> defaultEnabled = [true, true, false, true];
}
