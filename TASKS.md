# Tasks — figma_009 (Wallet)

## Layer 0 — Foundation (master)

- [x] Flutter project scaffold + feature folders
- [x] go_router shell + placeholder screens
- [x] Base theme (colors, typography, ThemeExtension)
- [x] Project documentation

## Layer 1 — Design tokens (`task/001-theme`) ✅

- [x] Figma gradient paint styles → `AppColors`
- [x] Spacing / radius tokens → `DesignConstants`
- [x] Theme tests

## Layer 2 — Shared widgets ✅

### `task/002-buttons`

- [x] `WalletPrimaryButton` (Button / Primary)
- [x] `WalletSecondaryButton` (Button / Secondary)
- [x] `WalletCircleButton` (Button / Circle)
- [x] Widget tests

### `task/003-bars`

- [x] `WalletBottomTabBar` (Bar / Bottom / Tab Bar)
- [x] `WalletNavigationBar` (Bar / Navigation)
- [x] Update `MainShell` to use custom tab bar
- [x] Widget tests

## Layer 3 — Screens

### `task/004-splash` ✅

- [x] Splash screen UI from Figma frame `0:68`
- [x] Gradient title text "AltCoin\nWallet"
- [x] Auto-navigate to onboarding (timer)
- [x] Widget test update

## Layer 4 — Onboarding flow ✅

### `task/005-onboarding`

- [x] Onboarding screen UI (0:57)
- [x] WalletSectionTitle + next button
- [x] Figma hero image asset

### `task/006-seed-phrase`

- [x] SeedPhraseChip component
- [x] Seed Phrase grid screen
- [x] Copy / Continue actions

### `task/007-recovery`

- [x] WalletInputField component
- [x] Recovery screen with phrase + name inputs
- [x] Cancel / Add actions

## Layer 5 — Wallet (`task/008-wallet`) ✅

- [x] WalletBalanceCard（余额 + Send/Receive/Buy）
- [x] WalletTokenCell 代币列表行
- [x] Wallet 主 Tab 页面
- [x] Widget test

## Layer 6 — Transactions (`task/009-transactions`) ✅

- [x] Send + Send Detail screens
- [x] Buy + Buy Detail screens
- [x] Receive + Receive Detail screens
- [x] TransactionAmountPanel + market/receive widgets
- [x] Widget tests

## Layer 7 — Tabs & flows (`task/010-tabs`) ✅

- [x] Swap 主 Tab 页面
- [x] Notification 主 Tab 页面
- [x] Settings 主 Tab + Security/Wallet/Price Alerts 子流程
- [x] Add Token / Search / Custom Token
- [x] Widget tests

## Layer 8 — Wallet sub-flows (`task/011-wallet-sub`) ✅

- [x] Detail 代币详情 + 交易历史
- [x] Wallet Scroll 扩展列表（含 Wave）
- [x] Scan 扫码页
- [x] Widget tests

## Layer 9 — Polish (`task/012-polish`) ✅

- [x] WalletSlideConfirm 滑动确认组件
- [x] 交易/设置详情页接入 Slide to Swap
- [x] Wallet 余额卡跳转 Scroll 列表
- [x] App Shell 导航集成测试
- [x] Web 字体运行时加载配置

## Layer 10 — Assets (`task/013-assets`) ✅

- [x] 从 Figma Symbols 导出底部 Tab 图标 PNG
- [x] `WalletAssets` 常量 + `WalletBottomTabBar` 接入图片资源
- [x] `WalletSlideConfirm` 松手回弹动画
- [x] 修复 `wallet_slide_confirm` clamp 类型与测试 import

## Layer 11 — Icons (`task/014-icons`) ✅

- [x] 导出导航/操作图标（Back、Search、Send、Down、Buy、Scan）
- [x] 导出 56px 代币图标（BTC/ETH/DASH/WAV/PEC/BNB/XRP）
- [x] `WalletAssetIcon` + `WalletCoinIcon` 共享组件
- [x] 导航栏、余额卡、代币列表、Swap 接入 Figma 图标

## Layer 12 — Settings & misc icons (`task/015-settings-icons`) ✅

- [x] Settings / Security 菜单 56px 图标
- [x] Receive 页 Buy / Set Amount / Share 图标
- [x] Swap 切换、Buy Detail、趋势箭头、Slide 滑块、Onboarding 按钮
- [x] `lib/` 内 Material Icons 全部替换为 Figma 资源

## Layer 13 — Fonts & QA (`task/016-fonts`) ✅

- [x] 内嵌 Clash Display Medium/Semibold（Fontshare FFL）
- [x] `WalletPasscodeKeypad` + Passcode Back 图标
- [x] `WalletSwitchToggle` + Price Alerts 开关
- [x] `flutter build web` 验证通过
- [x] 字体与 Passcode 组件测试（41 tests）