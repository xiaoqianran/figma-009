import 'package:figma_009/shared/widgets/cells/wallet_add_token_cell.dart';
import 'package:flutter/material.dart';

abstract final class MockAddTokens {
  static const List<AddTokenItem> items = [
    AddTokenItem(name: 'Bitcoin', symbol: 'BTC', iconColor: Color(0xFFB0C7FF)),
    AddTokenItem(name: 'Ethereum', symbol: 'ETH', iconColor: Color(0xFFFFBABA)),
    AddTokenItem(name: 'Wave', symbol: 'WAV', iconColor: Color(0xFFB0C7FF)),
    AddTokenItem(name: 'Dash', symbol: 'DAH', iconColor: Color(0xFFB8FF00)),
    AddTokenItem(name: 'BNB', symbol: 'BNB', iconColor: Color(0xFFFFE066)),
    AddTokenItem(name: 'Ripple', symbol: 'XRP', iconColor: Color(0xFFB0C7FF)),
  ];
}
