## 2024-05-18 - Deprecated Color.withOpacity Warning
**Learning:** Flutter's static analysis now strictly flags `Color.withOpacity(alpha)` as deprecated and warns to use `Color.withValues(alpha: alpha)` to avoid precision loss.
**Action:** Always replace `.withOpacity()` with `.withValues(alpha: )` when fixing linting issues or optimizing code to prevent noise from deprecation warnings.

## 2024-05-18 - ValueNotifier Anti-Pattern in StatelessWidget
**Learning:** Instantiating a `ValueNotifier` or similar disposable controller directly as a class property of a `StatelessWidget` is a severe anti-pattern. Because `StatelessWidget` lacks lifecycle hooks, this causes state loss during parent rebuilds and introduces memory leaks since `dispose()` cannot be called.
**Action:** Always manage such controllers within a `StatefulWidget` using `initState` and `dispose`. Alternatively, for largely static screens, prioritize refactoring UI helpers into `const StatelessWidget` classes over attempting unnecessary state optimizations.
