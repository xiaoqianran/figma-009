# Progress — figma_009

**Last updated:** 2026-07-05  
**Branch:** `master` @ `54f78cc`  
**Remote:** `origin` → https://github.com/xiaoqianran/figma-009.git

## Current status

| Check | Result |
|-------|--------|
| `flutter analyze` | No issues |
| `flutter test` | **36 / 36** passing |
| Design frames | All implemented (no runtime `FigmaPlaceholderScreen` routes) |
| Icons in `lib/` | 100% Figma PNG assets (`WalletAssets`) — no `Icons.*` |
| Layers | **0–12 complete** (see [TASKS.md](TASKS.md)) |

## Milestone timeline

### Layer 0 — Foundation

- Feature-based MVVM scaffold, `go_router`, dark theme tokens
- `MainShell` + route placeholders

### Layers 1–3 — Tokens & shared UI

- `AppColors`, `DesignConstants`, `AppTypography`, `WalletThemeExtension`
- Buttons, navigation bars, bottom tab bar
- Splash with gradient title + auto-navigate (2s → onboarding)

### Layer 4 — Onboarding

- Onboarding, Seed Phrase (12 chips), Recovery screens
- Tests: 17 → growing

### Layer 5 — Wallet tab

- `WalletBalanceCard`, `WalletTokenCell`, main Wallet screen

### Layer 6 — Transactions

- Send / Buy / Receive flows + detail screens
- `TransactionAmountPanel`, market/receive widgets

### Layer 7 — Other tabs & token management

- Swap, Notification, Settings (+ sub-flows)
- Add Token / Search / Custom Token

### Layer 8 — Wallet sub-flows

- Detail (`/detail/:id`), Wallet Scroll, Scan

### Layer 9 — Polish

- `WalletSlideConfirm`, balance card → scroll navigation
- App shell navigation tests, Web Google Fonts config

### Layer 10 — Tab assets

- Figma Tab bar PNGs, slide confirm snap animation

### Layer 11 — Nav & coin icons

- Back, Search, Send, coins (7), `WalletAssetIcon` / `WalletCoinIcon`

### Layer 12 — Settings & remaining icons

- Settings menu 56px icons, Receive actions, trend arrows
- All Material Icons removed from `lib/`

## Recent commits

| Commit | Summary |
|--------|---------|
| `54f78cc` | Settings 菜单与剩余页面接入 Figma 图标 |
| `689357e` | 导航与代币图标资源 |
| `4b5fa76` | Tab 图标 + 滑动确认动画 |
| `d14c37d` | 余额卡跳转 + Tab 点击测试 |
| `0544713` | WalletSlideConfirm + Shell 导航测试 |
| `4815432` | Detail / Scan / Scroll |
| `9ccad47` | Swap / Notification / Settings / Token |
| `d487b00` | Web 空白页修复 + 交易流程 |

## Worktree workflow (historical)

Early layers used git worktrees (`flutter_009-task-00x-*`). Worktrees were merged and cleaned; all work now lands on `master` with small feature commits.

## Next

See [TASKS.md](TASKS.md) Layer 13 (not started):

1. Clash Display font bundling
2. Settings passcode / switch Figma assets
3. Web release verification & optional golden tests