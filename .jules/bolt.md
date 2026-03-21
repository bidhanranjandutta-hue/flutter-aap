## 2024-05-24 - [Flutter Helper Methods vs StatelessWidgets]
**Learning:** Refactoring local UI helper methods (like _buildToolCard, _buildFileItem, or _buildLawCard) that return Widgets into explicit `const StatelessWidget` classes is a recommended Flutter performance practice. It allows the Flutter engine to short-circuit the widget building process and avoid unnecessary rebuilds.
**Action:** Always prefer `const StatelessWidget` over local helper methods returning `Widget` for UI components that don't depend on the parent's state, especially in lists or complex screens.
