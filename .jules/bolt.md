## YYYY-MM-DD - Fix Unbounded Route Stack
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Return to root tabs using Navigator.pushNamedAndRemoveUntil(..., (route) => false) to prevent unbounded stacks.