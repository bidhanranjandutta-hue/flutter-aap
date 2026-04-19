## 2024-05-18 - [Flutter UI Rebuild Optimization]
**Learning:** When optimizing primarily static mockups, avoid complex state extractions (like isolating state with ValueNotifier) if the state's semantic purpose controls un-isolated dependent content. It can cause architectural state regressions.
**Action:** Prioritize refactoring static UI `_buildHelper` methods into `const StatelessWidget` classes. This safely optimizes build times by skipping the build phase without risking state trapping.
