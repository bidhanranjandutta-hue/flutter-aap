## 2024-05-26 - Navigation Performance in Flutter Bottom Navigation
**Learning:** Flutter's `BottomNavigationBar` typically pushes new routes onto the stack on each tab tap. Since standard `Navigator.pushNamed` doesn't clear the stack or replace the current route, navigating between root-level tabs repeatedly can create a massive, unbounded route stack, leading to increased memory usage and degraded performance over time.
**Action:** Use `Navigator.pushReplacementNamed` or `Navigator.pushNamedAndRemoveUntil` when switching between top-level screens via a bottom navigation bar to keep the route stack flat and performant.

## 2024-05-26 - Deprecated `withOpacity` vs `withValues`
**Learning:** `Color.withOpacity()` is deprecated in newer Flutter versions due to precision loss.
**Action:** Use `Color.withValues(alpha: X)` to safely apply transparency to colors.
