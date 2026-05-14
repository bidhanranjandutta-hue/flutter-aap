## 2024-05-14 - withOpacity is deprecated in Flutter 3.27+
**Learning:** The method `Color.withOpacity(double)` is deprecated in modern Flutter, and using it causes linter warnings.
**Action:** Use `Color.withValues(alpha: double)` instead to prevent precision loss and resolve `deprecated_member_use` warnings.

## 2024-05-14 - Refactoring build methods into const Widgets
**Learning:** Extracting `_build*` UI-helper methods into dedicated `StatelessWidget` classes and calling them with `const` gives measurable performance wins in Flutter, especially for frequently-rebuilt `StatefulWidget` classes.
**Action:** Extract UI-building helper methods into `const` classes rather than using functions.
