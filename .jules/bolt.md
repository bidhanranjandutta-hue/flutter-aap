## YYYY-MM-DD - Flutter Route Stack Optimization
**Learning:** Using Navigator.pushNamed repeatedly when returning to a root-level tab creates an unbounded route stack and memory leak.
**Action:** Navigate away from root tabs with pushNamed to preserve the back button, but return to root tabs using Navigator.pushNamedAndRemoveUntil(..., (route) => false) to prevent unbounded stacks.