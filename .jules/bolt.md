## 2024-05-29 - Prevent unbounded route stack memory leak
**Learning:** In Flutter, repeatedly using `Navigator.pushNamed` for root-level navigation (like inside a `BottomNavigationBar` or landing page routing) creates an unbounded route stack and memory leaks.
**Action:** Use `Navigator.pushNamedAndRemoveUntil` for dashboard transitions and `Navigator.pushReplacementNamed` for sibling views inside the dashboard to keep the stack flat.

## 2024-05-29 - Deprecated withOpacity performance
**Learning:** `Color.withOpacity` is deprecated and causes precision loss.
**Action:** Use `Color.withValues(alpha: X)` instead of `.withOpacity(X)` to avoid precision loss.
