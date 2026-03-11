## 2024-03-12 - [Theme.of(context) O(1) Cache Lookup Optimization]
**Learning:** In Flutter, while `Theme.of(context)` is an O(1) hash map lookup, repeating it dozens of times in a single `build` method across long lists or complex screens still introduces measurable CPU overhead on every re-render.
**Action:** Extract `Theme.of(context)` into a single `final theme = Theme.of(context);` local variable at the top of the `build` method and pass it directly to private UI helper methods.
