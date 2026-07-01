## YYYY-MM-DD - Route Stack Memory Leak
**Learning:** Repeatedly using Navigator.pushNamed for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Return to root tabs using pushNamedAndRemoveUntil with an empty stack.