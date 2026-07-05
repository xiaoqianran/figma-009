# Flutter AI Rules — figma_009 (Wallet)

Based on [Flutter AI rules](https://docs.flutter.dev/ai/ai-rules) and the **Wallet** Figma file.

## Project context

- **Figma file:** Wallet (375×812 mobile frames)
- **Fonts:** Clash Display (titles), Poppins (body)
- **Theme:** Dark-first; paint styles: Black, White, Gray, Green, Pink, Blue, Gradient, Blur, Main
- **Architecture:** Feature-based MVVM with `presentation` / `domain` / `data` per feature

## Coding standards

- Follow Effective Dart; `snake_case` files, `PascalCase` classes, `camelCase` members
- Prefer `StatelessWidget`, composition, `const` constructors, private widget classes
- State: `ValueNotifier` / `ChangeNotifier` + `ListenableBuilder` (no third-party state libs unless requested)
- Routing: `go_router` for all navigable screens; `Navigator` only for dialogs/overlays
- Logging: `dart:developer` `log`, not `print`
- Lists: `ListView.builder` / `SliverList`
- Theme: centralized `ThemeData` + `ThemeExtension` for Figma tokens
- JSON: `json_serializable` when models are needed
- Run `dart format` and `flutter analyze` before finishing

## Figma → code mapping

| Figma component prefix | Dart location |
|---|---|
| `Bar / Navigation` | `lib/shared/widgets/bars/` |
| `Bar / Bottom / Tab Bar` | `lib/shared/widgets/bars/` |
| `Button /` | `lib/shared/widgets/buttons/` |
| `Cell /` | `lib/shared/widgets/cells/` |
| `Icon /` | `lib/shared/widgets/icons/` |
| `Other /` | `lib/shared/widgets/other/` |
| Screen frames (Design page) | `lib/features/<feature>/presentation/screens/` |

## Implementation order

1. `core/theme` — colors, typography, spacing from Figma styles
2. `shared/widgets` — reusable components (bars, buttons, cells)
3. `features/onboarding` — Splash → Onboarding → Seed Phrase → Recovery
4. `features/wallet` — main tab + Detail + Scan
5. `features/transaction` — Buy / Send / Receive / Swap flows
6. `features/token` — Add / Search / Custom Token
7. `features/notification` + `features/settings`