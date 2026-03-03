
## 2026-03-03 - Flutter UI Builder Methods Refactor
**Learning:** In Flutter, using helper methods (like `_buildWidget()`) to return UI components causes the framework to rebuild those components every time the parent builds, bypassing the `const` optimization.
**Action:** Extract UI helper methods into `const StatelessWidget` classes so the framework can short-circuit rebuilds for those specific components, significantly reducing CPU usage during re-renders.
