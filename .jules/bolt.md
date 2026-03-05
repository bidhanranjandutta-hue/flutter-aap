
## $(date +%Y-%m-%d) - Extract `_buildLegalCard` to StatelessWidget
**Learning:** Extracting local helper methods (like `_buildLegalCard`) that return Widgets into proper `const StatelessWidget` classes reduces the widget building overhead by taking advantage of Dart's `const` constructors. This skips unnecessary element tree updates when parent widgets rebuild.
**Action:** When creating reusable UI components inside a file, define them as `const StatelessWidget` instead of private methods returning a `Widget` to improve overall rendering performance.
