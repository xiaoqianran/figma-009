/// Route paths aligned with Figma Design page frames.
abstract final class AppRoutes {
  // Onboarding flow
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String seedPhrase = '/seed-phrase';
  static const String recovery = '/recovery';

  // Main shell (bottom tab bar)
  static const String wallet = '/wallet';
  static const String swap = '/swap';
  static const String notification = '/notification';
  static const String settings = '/settings';

  // Wallet sub-flows
  static const String walletScroll = '/wallet/scroll';
  static const String scan = '/scan';
  static const String detail = '/detail';

  // Token management
  static const String addToken = '/token/add';
  static const String addTokenSearch = '/token/add/search';
  static const String customToken = '/token/custom';

  // Transactions
  static const String buy = '/buy';
  static const String buyDetail = '/buy/detail';
  static const String send = '/send';
  static const String sendDetail = '/send/detail';
  static const String receive = '/receive';
  static const String receiveDetail = '/receive/detail';

  // Settings sub-flows
  static const String settingsWallet = '/settings/wallet';
  static const String settingsInput = '/settings/input';
  static const String settingsSlide = '/settings/slide';
  static const String settingsSecurity = '/settings/security';
  static const String settingsPasscode = '/settings/security/passcode';
  static const String settingsAutoLock = '/settings/security/autolock';
  static const String settingsMethod = '/settings/security/method';
  static const String settingsPriceAlerts = '/settings/price-alerts';
}
