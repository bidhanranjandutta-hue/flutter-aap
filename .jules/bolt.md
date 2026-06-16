## 2026-06-16 - Flatten Navigation Route Stack
**Learning:** Repeatedly pushing root tabs with pushNamed causes memory leaks through unbounded route stacks.
**Action:** Always use pushNamedAndRemoveUntil when returning to a root dashboard to preserve memory and correct back-button behavior.
