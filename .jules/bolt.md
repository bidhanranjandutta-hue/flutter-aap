# Bolt's Journal
## 2026-04-28 - Extracted widgets with parameters
**Learning:** Extracting local UI builder methods into `const StatelessWidget` classes is a powerful way to reduce Flutter widget rebuild costs. However, methods that accept non-constant arguments like `BuildContext` or rely on state variables cannot simply be transformed into `const` widgets if the arguments change.
**Action:** When extracting builder methods, ensure the new widget is truly stateless and its constructor parameters allow for `const` instantiation, especially when refactoring components nested in frequent rebuild paths.
