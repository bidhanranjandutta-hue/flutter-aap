## 2025-05-02 - UI Helper Widget Refactoring
**Learning:** Helper methods that build UI (e.g., `_buildToolCard`, `_buildFileItem`) run during every parent rebuild. To prevent unnecessary re-renders in Flutter, extract these methods into private stateless widgets and invoke them using `const`.
**Action:** Refactor UI-building helper methods into standalone `StatelessWidget` classes and use the `const` keyword at call sites.
