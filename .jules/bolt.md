## 2026-06-14 - Flatten Navigation Route Stack
**Learning:** In Flutter, using `Navigator.pushNamed` repeatedly for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Navigate away from the root tab using `pushNamed`, and return to the root tab using `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` to fix unbounded route stacks.
