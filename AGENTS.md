# Flutter AI Rules — figma_009 (Wallet)

Rules for AI agents and contributors. Based on [Flutter AI rules](https://docs.flutter.dev/ai/ai-rules) and the **Wallet** Figma file.

## Project context

| Item | Value |
|------|-------|
| Figma file | **Wallet** — 375×812 frames |
| Pages | Design, Typography, Symbols |
| Fonts (design) | Clash Display (titles), Poppins (body) |
| Theme | Dark-first; tokens in `AppColors`, `DesignConstants` |
| Architecture | Feature MVVM: `presentation` / `domain` / `data` |
| Status | Layers 0–16 done · 28 screens · 52 tests |

Read [README.md](README.md) and [ARCHITECTURE.md](ARCHITECTURE.md) before large changes.

## Coding standards

- Effective Dart: `snake_case` files, `PascalCase` classes, `camelCase` members
- Prefer `StatelessWidget`, `const` constructors, private widget classes
- State: `ValueNotifier` / `ChangeNotifier` + `ListenableBuilder` when needed
- Routing: `go_router` only; paths in `app_routes.dart`
- Logging: `dart:developer` `log`, not `print`
- Lists: `ListView.builder` / `SliverList`
- Icons: **Figma PNGs** via `WalletAssets` + `WalletAssetIcon` / `WalletCoinIcon` — do not add `Icons.*` to `lib/`
- Before finishing: `dart format lib test`, `flutter analyze`, `flutter test`

## Figma → code mapping

| Figma component prefix | Dart location |
|------------------------|---------------|
| `Bar / Navigation` | `lib/shared/widgets/bars/` |
| `Bar / Bottom / Tab Bar` | `lib/shared/widgets/bars/` |
| `Button /` | `lib/shared/widgets/buttons/` |
| `Cell /` | `lib/shared/widgets/cells/` |
| `Icon /` | `assets/icons/` + `lib/shared/widgets/other/wallet_*_icon.dart` |
| `Other /` | `lib/shared/widgets/other/` |
| Design page frames | `lib/features/<feature>/presentation/screens/` |

Asset paths: `lib/core/constants/wallet_assets.dart`.

## Figma MCP workflow

1. `get_metadata` — confirm Wallet file + Design page
2. `get_styles` / `get_variable_defs` — theme alignment
3. `get_design_context(depth=2, detail="compact", dedupe_components=true)` — screen structure
4. `get_node` / `scan_text_nodes` — details & copy
5. `save_screenshots` — export Symbols (PNG, scale 2) to `assets/icons/`
6. `get_screenshot` — visual QA only

Node IDs: colon format (`0:2`).

## Implementation order (completed)

1. ✅ `core/theme` — colors, typography, spacing
2. ✅ `shared/widgets` — bars, buttons, cells, icons
3. ✅ `features/onboarding` — Splash → Recovery
4. ✅ `features/wallet` — tab + Detail + Scan + Scroll
5. ✅ `features/transaction` — Buy / Send / Receive / Swap
6. ✅ `features/token` — Add / Search / Custom
7. ✅ `features/notification` + `features/settings`
8. ✅ Figma icon assets (Layers 10–12)

## Next work (Layer 13+)

1. Bundle Clash Display in `assets/fonts/`
2. Passcode keypad / switch components from Symbols
3. Golden / visual regression tests (optional)

## Do not

- Edit `.dart_tool/`, `build/`, `.idea/`, `.metadata`
- Use `FigmaPlaceholderScreen` for new routes — implement real screens
- Open `web/index.html` via `file://` for QA — use `build/web` HTTP server
- Commit unrelated refactors with feature work