## YYYY-MM-DD - Unbounded Route Stacks in Navigation
**Learning:** Repeatedly pushing root tabs using pushNamed creates an unbounded route stack and memory leak.
**Action:** Use pushNamedAndRemoveUntil to prevent memory leaks while returning to the root tab.
