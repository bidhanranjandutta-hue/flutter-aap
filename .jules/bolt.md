## 2025-02-12 - Extract Builder Methods into StatelessWidgets
**Learning:** Returning widgets from helper methods (like `_buildToolCard`) does not fully leverage Flutter's render optimization because the framework diffs them as part of the massive parent widget.
**Action:** Always extract complex, localized UI builder methods into explicit `const StatelessWidget` classes. This improves code readability and allows the engine to short-circuit the widget building process, providing a measurable performance gain.
