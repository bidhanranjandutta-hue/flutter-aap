## 2024-06-12 - Prevent unbounded navigation stacks in BottomNavigationBar
**Learning:** In Flutter, repeatedly using `Navigator.pushNamed` to return to root tabs from sub-tabs creates an infinitely growing navigation stack, leading to memory leaks and performance degradation.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` when returning to a root tab to clear the stack, and use it for one-way flows (like post-login) to prevent users from going back.
