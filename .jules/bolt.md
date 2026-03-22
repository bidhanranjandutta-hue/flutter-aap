## 2024-05-24 - [Extracting UI helper methods to StatelessWidgets]
**Learning:** In Flutter, UI helper methods (like `_buildToolCard` or `_buildFileItem` returning Widgets) negatively impact performance compared to explicit `const StatelessWidget` classes. They hinder the framework's element tree diffing algorithm from running efficiently, over-scope rebuilds, and prevent the engine from short-circuiting the widget building process using `const`.
**Action:** Refactor local UI helper methods into explicit `const StatelessWidget` classes to optimize the rebuild process.
