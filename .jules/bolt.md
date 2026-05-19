## 2024-05-19 - Unbounded Route Stack Memory Leaks
**Learning:** Using Navigator.pushNamed for root-level tab navigation creates an unbounded route stack and leads to memory leaks in Flutter.
**Action:** Use Navigator.pushNamedAndRemoveUntil or pushReplacementNamed to keep the stack flat during main navigation flow changes.
