
## 2024-05-24 - Optimizing static mock UIs with const StatelessWidget
**Learning:** UI-building helper methods execute during every parent rebuild. For screens that are primarily static mockups, replacing these with `const StatelessWidget` classes safely optimizes build times without risking architectural state regressions or trapped state.
**Action:** When a static screen rebuilds often (e.g. from segmented control toggles), refactor stateless `_buildHelper` methods into dedicated `const StatelessWidget` classes.
