## 2026-06-12 - Unbounded Route Stacks in Flutter Navigation
**Learning:** Using `Navigator.pushNamed` repeatedly to navigate to root tabs (like the Dashboard) from other screens creates an unbounded route stack and memory leaks.
**Action:** When returning to a root dashboard tab or navigating away one-way (e.g. from a welcome screen), always use `Navigator.pushNamedAndRemoveUntil` with `(route) => false` to clear the existing route stack.
