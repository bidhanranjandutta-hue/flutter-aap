## 2024-05-27 - Unbounded Route Stacks in Flutter Bottom Navigation Bars
**Learning:** Using `Navigator.pushNamed` repeatedly when switching tabs on a bottom navigation bar creates an unbounded route stack that persists in the background, consuming memory indefinitely as the user cycles through tabs.
**Action:** Always replace `Navigator.pushNamed` with `Navigator.pushNamedAndRemoveUntil(..., (route) => false)` or `Navigator.pushReplacementNamed` for root-level tab switches to maintain a flat navigation hierarchy.
