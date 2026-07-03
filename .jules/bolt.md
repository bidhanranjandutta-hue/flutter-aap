## YYYY-MM-DD - Route Stack Memory Leak
**Learning:** Using `Navigator.pushNamed` for root-level bottom navigation creates an unbounded route stack and memory leaks.
**Action:** Use `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` when returning to root tabs or for one-way flows like login.