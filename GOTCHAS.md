# Gotchas — figma_009

## Figma MCP

- Requires Figma Desktop + **Figma MCP Go** plugin connected (default `127.0.0.1:1994`).
- Node IDs use **colon** format (`0:68`), not hyphen (`0-68`).
- Large pages: use `get_design_context(depth=1, detail="minimal")` first, then drill into sections.

## Fonts

- **Clash Display** is not on Google Fonts. `AppTypography` uses Space Grotesk as display fallback until fonts are bundled under `assets/fonts/`.
- **Poppins** loads via `google_fonts` at runtime; tests must set `GoogleFonts.config.allowRuntimeFetching = false`.

## Theme

- Figma paint style **Main** is an image fill, not a solid color. Splash title uses stroke + fill text layers; replicate with `ShaderMask` + gradient or stacked `Text` widgets.
- Gradient paint styles (Green, Pink, Blue) are radial; title gradient is linear with 5 stops.

## Flutter

- Do not edit `.dart_tool/`, `build/`, `.idea/`, `.metadata`.
- Shell tab routes must stay branch-aligned: `/wallet`, `/swap`, `/notification`, `/settings`.

## Git worktree

- Worktrees live as siblings: `flutter_009-task-xxx`.
- Merge task branches into `master` in numeric order to reduce conflicts.