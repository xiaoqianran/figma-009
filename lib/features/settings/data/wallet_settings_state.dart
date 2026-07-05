import 'package:flutter/foundation.dart';

/// In-memory mock settings persisted across Security sub-flows.
class WalletSettingsState extends ChangeNotifier {
  WalletSettingsState._();

  static final WalletSettingsState instance = WalletSettingsState._();

  static const List<String> autoLockOptions = [
    'Immediate',
    'If away for 1 minute',
    'If away for 5 minute',
    'If away for 1 hour',
  ];

  static const List<String> lockMethodOptions = [
    'Passcode',
    'Passcode / Face ID',
  ];

  int _autoLockIndex = 1;
  int _lockMethodIndex = 1;

  int get autoLockIndex => _autoLockIndex;
  int get lockMethodIndex => _lockMethodIndex;

  String get autoLockLabel => autoLockOptions[_autoLockIndex];
  String get lockMethodLabel => lockMethodOptions[_lockMethodIndex];

  void setAutoLock(int index) {
    if (index == _autoLockIndex ||
        index < 0 ||
        index >= autoLockOptions.length) {
      return;
    }
    _autoLockIndex = index;
    notifyListeners();
  }

  void setLockMethod(int index) {
    if (index == _lockMethodIndex ||
        index < 0 ||
        index >= lockMethodOptions.length) {
      return;
    }
    _lockMethodIndex = index;
    notifyListeners();
  }
}
