## YYYY-MM-DD - Route Stack Memory Leaks in Flutter Bottom Nav
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil with (route) => false when returning to root tabs to prevent unbounded stacks, and for one-way login flows.