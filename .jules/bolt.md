## YYYY-MM-DD - Route Stack Optimization
**Learning:** Repeatedly using Navigator.pushNamed for root-level navigation creates unbounded route stacks and memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil when returning to root tabs to prevent unbounded stacks.