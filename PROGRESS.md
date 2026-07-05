# Progress — figma_009

## 2026-07-05

### Done

- Initial Flutter scaffold with MVVM folder structure
- go_router: onboarding routes + StatefulShellRoute (Wallet/Swap/Notification/Settings)
- Base theme: AppColors, AppTypography, WalletThemeExtension, AppTheme
- FigmaPlaceholderScreen for all 30+ routes
- MainShell with Material NavigationBar placeholder
- `flutter analyze` — no issues
- `flutter test` — 1 test passing

### Layer 1–3 complete (worktree workflow)

| Task | Branch | Commit |
|---|---|---|
| Theme tokens | `task/001-theme` | feat: 从 Figma 完善主题色与间距设计 tokens |
| Buttons | `task/002-buttons` | feat: 新增 Wallet 按钮共享组件 |
| Bars | `task/003-bars` | feat: 新增底部 Tab 栏与顶部导航栏组件 |
| Splash | `task/004-splash` | feat: 实现 Splash 启动页与渐变标题 |

- `flutter analyze` — no issues
- `flutter test` — 12 tests passing

### Layer 4 complete (onboarding flow)

| Task | Branch | Commit |
|---|---|---|
| Onboarding | `task/005-onboarding` | feat: 实现 Onboarding 引导页 |
| Seed Phrase | `task/006-seed-phrase` | feat: 实现 Seed Phrase 助记词页面 |
| Recovery | `task/007-recovery` | feat: 实现 Recovery 钱包恢复页面 |

- `flutter analyze` — no issues
- `flutter test` — 17 tests passing
- Worktrees cleaned; pushed to `origin/master`

### Next

- Wallet main tab UI