## $(date +%Y-%m-%d) - Fix Unbounded Route Stack in Flutter Bottom Navigation
**Learning:** Repeatedly using `Navigator.pushNamed` to return to a root tab from other bottom navigation items creates an unbounded route stack and memory leak in this codebase's architecture.
**Action:** Always navigate away from root tabs using `pushNamed` to preserve the back button, but return to root tabs using `pushNamedAndRemoveUntil(..., (route) => false)` to clear the stack.
