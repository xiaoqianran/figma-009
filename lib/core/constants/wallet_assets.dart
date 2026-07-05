/// Figma Symbols page asset paths.
abstract final class WalletAssets {
  static const String tabWallet = 'assets/icons/tab_wallet.png';
  static const String tabSwap = 'assets/icons/tab_swap.png';
  static const String tabNotification = 'assets/icons/tab_notification.png';
  static const String tabSettings = 'assets/icons/tab_settings.png';

  static const String iconBack = 'assets/icons/icon_back.png';
  static const String iconSearch = 'assets/icons/icon_search.png';
  static const String iconSend = 'assets/icons/icon_send.png';
  static const String iconDown = 'assets/icons/icon_down.png';
  static const String iconBuy = 'assets/icons/icon_buy.png';
  static const String iconScan = 'assets/icons/icon_scan.png';
  static const String iconShare = 'assets/icons/icon_share.png';
  static const String iconAdd = 'assets/icons/icon_add.png';
  static const String iconAmount = 'assets/icons/icon_amount.png';
  static const String iconArrow = 'assets/icons/icon_arrow.png';
  static const String iconSwapVertical = 'assets/icons/icon_swap_vertical.png';
  static const String iconCheck = 'assets/icons/icon_check.png';

  static const String setLock = 'assets/icons/set_lock.png';
  static const String setNoti = 'assets/icons/set_noti.png';
  static const String setPreferences = 'assets/icons/set_preferences.png';
  static const String setPriceAlerts = 'assets/icons/set_price_alerts.png';
  static const String setAutolock = 'assets/icons/set_autolock.png';
  static const String setMethod = 'assets/icons/set_method.png';

  static const String coinBitcoin = 'assets/icons/coin_bitcoin.png';
  static const String coinEther = 'assets/icons/coin_ether.png';
  static const String coinDash = 'assets/icons/coin_dash.png';
  static const String coinWave = 'assets/icons/coin_wave.png';
  static const String coinPeercoin = 'assets/icons/coin_peercoin.png';
  static const String coinBnb = 'assets/icons/coin_bnb.png';
  static const String coinRipple = 'assets/icons/coin_ripple.png';

  static String coinForId(String id) {
    return switch (id) {
      'btc' => coinBitcoin,
      'eth' => coinEther,
      'pec' => coinPeercoin,
      'dah' => coinDash,
      'wav' => coinWave,
      'bnb' => coinBnb,
      'xrp' => coinRipple,
      _ => coinBitcoin,
    };
  }

  static String coinForSymbol(String symbol) {
    return switch (symbol.toUpperCase()) {
      'BTC' => coinBitcoin,
      'ETH' => coinEther,
      'PEC' => coinPeercoin,
      'DAH' => coinDash,
      'WAV' => coinWave,
      'BNB' => coinBnb,
      'XRP' => coinRipple,
      _ => coinBitcoin,
    };
  }
}
