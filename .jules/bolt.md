## YYYY-MM-DD - Unbounded Route Stack Memory Leaks
**Learning:** In Flutter, repeatedly using Navigator.pushNamed to return to root tabs creates unbounded route stacks, leading to memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil with (route) => false when returning to root tabs to clear the navigation history.