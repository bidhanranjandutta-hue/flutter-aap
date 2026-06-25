## YYYY-MM-DD - Unbounded Route Stack Memory Leaks
**Learning:** Using `pushNamed` for returning to a root tab from sub-screens in Flutter creates an unbounded route stack and memory leaks.
**Action:** Always use `pushNamedAndRemoveUntil(..., (route) => false)` when returning to root tabs to clear the accumulated stack and free memory.