## YYYY-MM-DD - Route Stack Memory Leak
**Learning:** Repeatedly navigating to the root tab via `Navigator.pushNamed` inside a `BottomNavigationBar` creates an unbounded route stack and memory leak.
**Action:** Navigate away from the root tab using `pushNamed` and return to it using `pushNamedAndRemoveUntil` to reset the stack.