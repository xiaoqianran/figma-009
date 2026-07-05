# figma-009 — AltCoin Wallet

Flutter implementation of the **Wallet** Figma design (375×812 mobile). All Design-page frames are implemented; icons are exported from the Figma **Symbols** page.

| | |
|---|---|
| **Figma file** | Wallet — pages: Design, Typography, Symbols |
| **Remote** | https://github.com/xiaoqianran/figma-009.git |
| **Flutter** | SDK ^3.12.2 · `go_router` ^17 |
| **Status** | Layers 0–14 complete · 41 widget tests · `flutter analyze` clean |

## Quick start

```bash
cd flutter_009
flutter pub get
flutter run                    # mobile / desktop
flutter run -d chrome          # dev (Flutter-owned Chrome window)
```

### Web preview (recommended)

Do **not** open `web/index.html` directly (`file://`). Serve the **built** output:

```bash
flutter build web
cd build/web
python -m http.server 8765
# → http://localhost:8765/
```

Or use the web dev server:

```bash
flutter run -d web-server --web-port=8765
```

### Quality checks

```bash
dart format lib test
flutter analyze
flutter test
```

## Features

| Area | Screens / flows |
|------|-----------------|
| **Onboarding** | Splash → Onboarding → Seed Phrase → Recovery |
| **Main tabs** | Wallet · Swap · Notification · Settings |
| **Wallet** | Balance card, token list, Detail, Scroll list, Scan |
| **Transactions** | Send, Buy, Receive (+ detail flows), Swap |
| **Token** | Add Token, Search, Custom Token |
| **Settings** | Security (Passcode, Auto-Lock, Method), Preferences, Price Alerts, Slide confirm |

Mock data only — no backend or real wallet logic.

## Project layout

```
lib/
├── main.dart / app.dart
├── core/          # theme, router, design tokens, WalletAssets
├── shared/        # MainShell, bars, buttons, cells, icons
└── features/      # onboarding, wallet, transaction, token, notification, settings

assets/
├── images/        # onboarding_hero.png
└── icons/         # 29 PNGs from Figma Symbols (tabs, nav, coins, settings)

test/              # 15 test files, 36 cases
```

## Documentation

| Doc | Purpose |
|-----|---------|
| [ARCHITECTURE.md](ARCHITECTURE.md) | Folder structure, routing, navigation flow, Figma mapping |
| [TASKS.md](TASKS.md) | Layer-by-layer implementation checklist (0–12 ✅) |
| [PROGRESS.md](PROGRESS.md) | Timeline, commits, verification status |
| [TESTING.md](TESTING.md) | Test conventions, file inventory, CI commands |
| [GOTCHAS.md](GOTCHAS.md) | Web blank page, fonts, Figma MCP, common pitfalls |
| [AGENTS.md](AGENTS.md) | AI / contributor coding rules |

## Figma workflow

Uses **figma-mcp-go** (Figma Desktop plugin bridge). Typical flow:

1. `get_metadata` — confirm file + page
2. `get_design_context` / `get_node` — screen structure
3. `save_screenshots` — export Symbols to `assets/icons/`
4. Map components per `AGENTS.md` prefix table

## Next (Layer 13+)

- Bundle **Clash Display** under `assets/fonts/` (see [GOTCHAS.md](GOTCHAS.md))
- Settings sub-page assets (passcode keypad, switches)
- Optional: golden tests / visual regression against Figma exports