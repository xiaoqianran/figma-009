# Architecture — figma_009 (Wallet)

## Overview

Feature-based MVVM Flutter app mapped from the **Wallet** Figma file (375×812).

```
lib/
├── main.dart / app.dart          # Entry + MaterialApp.router
├── core/
│   ├── constants/                # Design dimensions from Figma
│   ├── router/                   # go_router routes + paths
│   └── theme/                    # ThemeData + ThemeExtension tokens
├── shared/
│   ├── layouts/                  # MainShell (bottom tab bar)
│   └── widgets/                  # Reusable Figma components
│       ├── bars/
│       ├── buttons/
│       ├── cells/
│       ├── icons/
│       └── other/
└── features/
    ├── onboarding/               # Splash → Onboarding → Seed Phrase → Recovery
    ├── wallet/                   # Wallet tab + Detail + Scan
    ├── transaction/              # Buy / Send / Receive / Swap
    ├── token/                    # Add / Search / Custom Token
    ├── notification/
    └── settings/
```

Each feature follows `presentation/` / `domain/` / `data/` as screens grow.

## Routing

- `go_router` with `StatefulShellRoute.indexedStack` for bottom tabs.
- Onboarding and modal flows use top-level `GoRoute`s.
- Route paths mirror Figma frame names in `app_routes.dart`.

## State

- `ValueNotifier` / `ChangeNotifier` + `ListenableBuilder`.
- No third-party state libraries unless requested.

## Figma MCP workflow

1. `get_metadata` → confirm Wallet file + Design page.
2. `get_styles` / `export_tokens` → theme tokens.
3. `get_design_context` / `get_node` → screen structure.
4. Map components via `AGENTS.md` prefix table.

## Worktree convention

| Directory | Branch | Purpose |
|---|---|---|
| `flutter_009` | `master` | Integration branch |
| `flutter_009-task-001-theme` | `task/001-theme` | Theme tokens |
| `flutter_009-task-002-buttons` | `task/002-buttons` | Button widgets |
| `flutter_009-task-003-bars` | `task/003-bars` | Navigation bars |
| `flutter_009-task-004-splash` | `task/004-splash` | Splash screen |

Merge order: 001 → 002 → 003 → 004 → master.