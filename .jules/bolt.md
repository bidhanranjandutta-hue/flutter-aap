
## $(date +%Y-%m-%d) - Extract `_buildActionButton` to `StatelessWidget` for Performance
**Learning:** Extracting local UI helper methods that return heavily-styled nested widgets into their own `const StatelessWidget` classes significantly avoids redundant rebuilds during localized state changes (e.g. `_viewMode` toggling).
**Action:** When working on Flutter screens containing many static UI segments, actively proactively construct UI pieces using `const StatelessWidget` instead of methods inside the State class to establish an optimized subtree.
