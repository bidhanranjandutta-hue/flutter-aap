## YYYY-MM-DD - Flutter Route Stack Memory Leaks
**Learning:** Using `Navigator.pushNamed` for BottomNavigationBar tab switching creates an unbounded navigation stack, leading to memory leaks and performance degradation.
**Action:** Use `Navigator.pushReplacementNamed` for root-level tab switching to keep the stack flat while preserving back-button behavior. Use `Navigator.pushNamedAndRemoveUntil` for post-login screens to clear the stack completely.
