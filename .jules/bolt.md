## YYYY-MM-DD - Fix Unbounded Route Stack Memory Leaks
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Navigate away from root tabs with pushNamed to preserve the back button, but return to root tabs using pushNamedAndRemoveUntil(..., (route) => false) to prevent unbounded stacks.