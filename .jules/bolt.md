## 2024-05-20 - Prevent Unbounded Route Stacks in Flutter Navigation
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation (like in BottomNavigationBar or after Login) causes the route stack to grow indefinitely, leading to memory leaks and performance degradation in Flutter applications.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil` (or `pushReplacementNamed`) for root-level tab switching or login flow completion to ensure the route stack remains flat.
