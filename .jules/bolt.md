## 2024-03-20 - Extracting UI Helper Methods to StatelessWidgets

**Learning:** In Flutter, using local helper methods (like `_buildToolCard` or `_buildFileItem`) that return `Widget` inside a `build` method is a common anti-pattern for performance. It prevents the Flutter framework from short-circuiting the widget tree reconciliation process. When the parent widget rebuilds, the helper method is always called, allocating new widget instances. If these are extracted into explicit `const StatelessWidget` classes, Flutter can use const instances and skip rebuilding those subtrees entirely if their inputs haven't changed.

**Action:** Whenever identifying complex UI components returned by local helper methods in a `build` function, extract them into separate `const StatelessWidget` classes to allow Flutter to optimize rendering.
