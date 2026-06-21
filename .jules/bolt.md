## YYYY-MM-DD - Prevent Unbounded Route Stack Memory Leaks
**Learning:** Using Navigator.pushNamed repeatedly to navigate to root tabs creates an unbounded route stack, leading to memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil with (route) => false when returning to root tabs to clear navigation history and prevent leaks.