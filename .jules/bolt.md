## YYYY-MM-DD - Unbounded Route Stacks in Tab Navigation
**Learning:** Using `Navigator.pushNamed` inside `BottomNavigationBar` creates an unbounded route stack, leading to memory leaks and performance degradation over time as users switch tabs repeatedly.
**Action:** Always use `Navigator.pushReplacementNamed` for tab-switching navigation to keep the navigation stack flat, and use `Navigator.pushNamedAndRemoveUntil` when transitioning from auth/welcome screens to the main app flow to clear the stack entirely.
