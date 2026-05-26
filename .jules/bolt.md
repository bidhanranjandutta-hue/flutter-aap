## 2024-05-26 - Unbounded Route Stack Memory Leak
**Learning:** Flutter's BottomNavigationBar or other top-level navigation elements using `Navigator.pushNamed` instead of `Navigator.pushReplacementNamed` creates an unbounded route stack memory leak. This is a common performance anti-pattern.
**Action:** Always verify root navigation methods and swap `pushNamed` to `pushReplacementNamed` or `pushNamedAndRemoveUntil` for root navigation elements to ensure memory remains stable.
