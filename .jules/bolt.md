## YYYY-MM-DD - Memory Leak in Root Navigation
**Learning:** Repeatedly pushing root tabs using Navigator.pushNamed inside BottomNavigationBar items builds an unbounded stack, leading to memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil when returning to root tabs (like dashboard) to clear the stack and avoid memory problems.
