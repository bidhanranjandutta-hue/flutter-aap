## YYYY-MM-DD - Fix Unbounded Route Stack
**Learning:** Repeatedly navigating to the root dashboard using pushNamed creates an unbounded route stack and memory leak.
**Action:** Use pushNamedAndRemoveUntil to prevent unbounded stacks when returning to root tabs.