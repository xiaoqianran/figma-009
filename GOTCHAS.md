# Gotchas — figma_009

## Web blank page

**Symptom:** Browser shows raw HTML title `figma_009` or `Wallet` with no Flutter UI.

**Causes:**

1. Opening `web/index.html` via `file://` — Flutter cannot load `main.dart.js`.
2. Serving `web/` instead of `build/web/` — stale or missing compiled JS.
3. `flutter run -d chrome` — UI appears in Flutter's Chrome instance, not an arbitrary browser tab you opened separately.

**Fix / preview:**

```bash
flutter build web
cd build/web && python -m http.server 8765
# open http://localhost:8765/
```

Or: `flutter run -d web-server --web-port=8765`

**GitHub Pages:** CI builds with `--base-href "/figma-009/"` and copies `index.html` → `404.html` for SPA routing. Live: https://xiaoqianran.github.io/figma-009/

`web/index.html` includes a loading spinner and 25s timeout message with these instructions.

## Fonts

| Font | Status |
|------|--------|
| **Clash Display** | Bundled in `assets/fonts/` (Medium 500, Semibold 600) — [Fontshare FFL](https://www.fontshare.com/fonts/clash-display) |
| **Poppins** | Bundled in `assets/fonts/Poppins-Medium.ttf` (weight 500) — [Google OFL](https://fonts.google.com/specimen/Poppins) |

License files: `assets/fonts/ClashDisplay-FFL.txt`, `assets/fonts/Poppins-OFL.txt`. Do not remove when redistributing fonts.

Both fonts are embedded — **no runtime network fetch** required for Web builds.

## Icons & assets

- All UI icons in `lib/` use **Figma PNGs** via `WalletAssets` — not Material `Icons`.
- New icons: Figma MCP `save_screenshots` → `assets/icons/` → add constant in `wallet_assets.dart`.
- `pubspec.yaml` declares `assets/icons/` as a directory — new PNGs are picked up automatically.
- `WalletAssetIcon` supports optional `color` via `ColorFiltered` + `BlendMode.srcIn` (e.g. black icons on gradient cards).
- `WalletCoinIcon` clips 56px coin art with 16px corner radius.

## Figma MCP

- Requires **Figma Desktop** + **figma-mcp-go** plugin (default `127.0.0.1:1994`).
- Node IDs: **colon** format (`0:68`), not hyphen (`0-68`).
- Large pages: `get_design_context(depth=1, detail="minimal")` first, then `get_node` on sections.
- Do not export full **Cell / Chart** frames as trend icons — they're 335×73; use `Icon / 24px / Arrow` instead.

## Theme

- Figma paint style **Main** is an image fill — Splash uses `GradientTitleText` (stacked stroke + fill).
- Gradient paints (Green, Pink, Blue, title) map to `AppColors` gradients.
- Dark-first: scaffold backgrounds `#000000`, dividers `#1E1E1E`.

## Routing

- Shell tab paths must stay branch-aligned: `/wallet`, `/swap`, `/notification`, `/settings`.
- `walletScroll` is a **child** of wallet branch: `/wallet/scroll`.
- Detail route: `/detail/:id` (top-level, not under shell).

## Git & repo hygiene

- Do not commit: `.dart_tool/`, `build/`, `.idea/`, `.metadata`
- Remote: `https://github.com/xiaoqianran/figma-009.git`
- Package name in code: `figma_009` (import prefix)

## `dart format` + analyze

Running `dart format` can reflow numeric code — if `wallet_slide_confirm.dart` breaks, ensure `maxOffset` uses explicit `double` + `.toDouble()` after `clamp()`.