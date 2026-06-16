## YYYY-MM-DD - Route Stack Memory Leaks
**Learning:** Repeatedly pushing root tabs like the dashboard without clearing the stack leads to an unbounded route stack and memory leaks in Flutter applications.
**Action:** Use `Navigator.pushNamedAndRemoveUntil` when returning to root tabs to ensure the navigation stack is properly reset.