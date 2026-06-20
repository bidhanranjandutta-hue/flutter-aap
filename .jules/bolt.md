## YYYY-MM-DD - Flutter BottomNavigationBar Route Stack Leak
**Learning:** Using `Navigator.pushNamed` inside `BottomNavigationBar` to return to the root tab creates an unbounded route stack, leading to memory leaks over time.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` when returning to root tabs from sub-tabs, while using standard `pushNamed` for navigating outward to preserve back-button state.
