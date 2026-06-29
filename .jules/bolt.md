## YYYY-MM-DD - Unbounded Navigation Route Stacks
**Learning:** In Flutter, repeatedly using `Navigator.pushNamed` for root-level navigation (like inside a `BottomNavigationBar` returning to the dashboard) creates an unbounded route stack, leading to memory leaks.
**Action:** Navigate away from root tabs with `pushNamed` to preserve the back button, but return to root tabs using `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` to flatten the stack. Also use it for one-way login flows.
