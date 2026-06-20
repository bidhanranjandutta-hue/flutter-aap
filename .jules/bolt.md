## YYYY-MM-DD - Unbounded Route Stack in Flutter
**Learning:** Repeatedly using Navigator.pushNamed to navigate to the root dashboard tab creates an unbounded route stack and memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil(context, '/dashbord', (route) => false) when returning to the root tab to clear the stack and prevent memory leaks.