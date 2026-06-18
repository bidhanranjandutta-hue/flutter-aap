## YYYY-MM-DD - Flatten Navigation Route Stack
**Learning:** Using pushNamed repeatedly for root dashboard navigation creates an unbounded route stack and memory leaks.
**Action:** Always use pushNamedAndRemoveUntil when returning to the root tab to clear the stack while preserving back-button behavior for sub-routes.