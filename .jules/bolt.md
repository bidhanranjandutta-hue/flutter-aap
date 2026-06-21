## 2026-06-21 - Unbounded Route Stacks in Navigation Bars
**Learning:** Repeatedly using Navigator.pushNamed for root-level navigation creates an unbounded route stack, leading to memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil when returning to root tabs, while preserving Navigator.pushNamed when navigating away from them to maintain the back button.
