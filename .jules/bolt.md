## 2024-05-24 - Unbounded Route Stacks in Flutter BottomNavigationBar
**Learning:** Using `Navigator.pushNamed` repeatedly for root-level tab navigation creates an unbounded route stack, leading to memory leaks and degraded performance over time as the stack grows infinitely.
**Action:** Always use `Navigator.pushNamedAndRemoveUntil` or `pushReplacementNamed` for root-level or tab-switching navigation to keep the route stack flat and preserve memory.
