# Testing — figma_009

## Commands

```bash
flutter analyze
flutter test
dart format lib test
```

Run from project root (`flutter_009` or active worktree).

## Conventions

- Widget tests live in `test/`.
- Disable Google Fonts network in tests:

```dart
TestWidgetsFlutterBinding.ensureInitialized();
GoogleFonts.config.allowRuntimeFetching = false;
```

## Per-layer checks

| Layer | Analyze | Test focus |
|---|---|---|
| Theme | `flutter analyze` | Token values, ThemeExtension lerp |
| Buttons | `flutter analyze` | Tap callbacks, disabled state |
| Bars | `flutter analyze` | Tab selection, label rendering |
| Screens | `flutter analyze` | Key text/widgets from Figma frame |

## Before merge

1. `dart format lib test`
2. `flutter analyze` — zero issues
3. `flutter test` — all green
4. Merge task branch → `master`