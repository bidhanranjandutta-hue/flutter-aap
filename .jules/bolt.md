## 2024-05-15 - [Flutter UI Rebuild Optimization]
**Learning:** In Flutter, using helper methods (like `_buildSummaryItem` or `_buildLegalCard`) to build UI components prevents the framework from caching the widget tree, forcing the component to rebuild every time the parent rebuilds.
**Action:** Always extract UI-building helper methods into `const StatelessWidget` classes to allow the framework to short-circuit the build phase for static sub-trees, improving rendering performance and reducing memory allocations.
