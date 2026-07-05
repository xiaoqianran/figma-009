# Testing — figma_009

## Commands

Run from project root (`flutter_009`):

```bash
dart format lib test
flutter analyze          # must report: No issues found!
flutter test             # 46 tests
flutter test test/features/wallet/wallet_screen_test.dart   # single file
```

## Test harness setup

Widget tests call `TestWidgetsFlutterBinding.ensureInitialized()` in `main()`. Fonts (Clash Display + Poppins) are bundled — no network I/O setup required.

## Inventory (46 tests / 19 files)

| File | Tests | Focus |
|------|-------|-------|
| `test/widget_test.dart` | 1 | App boots, splash gradient title |
| `test/app_shell_navigation_test.dart` | 2 | Shell `router.go` + tab tap navigation |
| `test/core/theme/app_colors_test.dart` | 2 | Gradient / color tokens |
| `test/core/theme/app_typography_test.dart` | 3 | Clash Display + Poppins family |
| `test/shared/widgets/buttons/wallet_passcode_key_test.dart` | 2 | Passcode keypad render + tap |
| `test/shared/widgets/other/wallet_passcode_indicator_test.dart` | 2 | PIN dot indicator |
| `test/features/settings/settings_passcode_screen_test.dart` | 3 | Passcode screen PIN entry |
| `test/shared/widgets/buttons/wallet_buttons_test.dart` | 3 | Primary, secondary, circle buttons |
| `test/shared/widgets/buttons/wallet_slide_confirm_test.dart` | 2 | Label, full drag confirm |
| `test/shared/widgets/bars/wallet_bars_test.dart` | 2 | Tab bar tap, nav bar title |
| `test/shared/widgets/other/wallet_trend_icon_test.dart` | 1 | Up/down trend icons |
| `test/features/onboarding/splash_screen_test.dart` | 1 | Auto-navigate after delay |
| `test/features/onboarding/onboarding_screen_test.dart` | 1 | Welcome title |
| `test/features/onboarding/seed_phrase_screen_test.dart` | 1 | 12 mnemonic chips |
| `test/features/onboarding/recovery_screen_test.dart` | 1 | Inputs + actions |
| `test/features/wallet/wallet_screen_test.dart` | 2 | Balance list, scroll navigation |
| `test/features/wallet/wallet_subflows_test.dart` | 3 | Detail, scroll, scan |
| `test/features/transaction/transaction_screens_test.dart` | 3 | Send list, send detail, buy |
| `test/features/layer7/layer7_screens_test.dart` | 4 | Swap, notification, settings, add token |

## Conventions

### Routing in tests

Prefer an isolated `GoRouter` with only the routes under test, or `createAppRouter()` from `app_router.dart` for integration-style shell tests:

```dart
final router = createAppRouter();
await tester.pumpWidget(
  MaterialApp.router(theme: AppTheme.dark(), routerConfig: router),
);
router.go(AppRoutes.wallet);
await tester.pumpAndSettle();
```

### Finding widgets after Figma asset migration

- **Do not** rely on `Icons.*` in `lib/` — there are none.
- Use `ValueKey`s where defined (`nav-back`, `tab-Swap`, `slide-thumb`, `scan-icon`).
- Use `find.text` / `find.byType` for screen-specific widgets.
- Image assets: `find.byType(WalletCoinIcon)` or keys on parent widgets.

### Common pitfalls

| Pitfall | Fix |
|---------|-----|
| `No GoRouter found in context` | Get router via `createAppRouter()` reference, not `GoRouter.of` on wrong widget |
| `WalletBottomTabBar` missing on splash/onboarding | Navigate to `/wallet` before asserting shell |
| `Transform` count assertions | MaterialApp adds extra transforms — assert your widget type only |
| `num` vs `double` in `clamp()` | Use `.toDouble()` on clamp result in `WalletSlideConfirm` |

## Before commit / push

1. `dart format lib test`
2. `flutter analyze` — zero issues
3. `flutter test` — all green
4. Do not commit `.dart_tool/`, `build/`, `.idea/`, `.metadata`