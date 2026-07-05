## 2026-07-05 - Route Stack Optimization
**Learning:** In Flutter, using Navigator.pushNamed repeatedly for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Use pushNamedAndRemoveUntil for returning to root tabs and one-way flows to prevent memory leaks while preserving the back button for deeper navigation.