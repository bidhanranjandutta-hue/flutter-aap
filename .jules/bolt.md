## YYYY-MM-DD - Route Stack Memory Leak
**Learning:** Repeatedly navigating back to the root tab using pushNamed creates an unbounded route stack and memory leak.
**Action:** Use pushNamedAndRemoveUntil when returning to root tabs to clear the stack while preserving back button behavior for sub-tabs.