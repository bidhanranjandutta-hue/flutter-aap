## 2024-03-24 - Flutter Widget Methods Anti-Pattern
**Learning:** Found multiple local UI helper methods (like `_buildFeatureItem`) that return Widgets instead of using explicit `const StatelessWidget` classes. This defeats the Flutter element tree diffing algorithm by expanding the build scope unnecessarily.
**Action:** Extract local widget-building methods into independent `const StatelessWidget` classes to allow the framework to cache widgets and short-circuit the build process effectively.
