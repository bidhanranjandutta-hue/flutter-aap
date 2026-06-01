## 2026-06-01 - Prevent Unbounded Navigation Stacks
**Learning:** In Flutter, repeatedly using `Navigator.pushNamed` for root-level tab navigation creates an unbounded route stack leading to memory leaks.
**Action:** Always use `Navigator.pushReplacementNamed` for tab switching, and use `Navigator.pushNamedAndRemoveUntil` for clearing stacks after one-way flows like login.
