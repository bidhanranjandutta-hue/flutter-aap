## 2026-06-22 - Prevent Unbounded Route Stacks
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level navigation creates an unbounded route stack and memory leaks in Flutter.
**Action:** Navigate away from the root tab with `pushNamed` to preserve the back button, but always return to the root tab using `Navigator.pushNamedAndRemoveUntil` to clear the stack.