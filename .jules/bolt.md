## YYYY-MM-DD - Unbounded Route Stacks in Flutter
**Learning:** Using Navigator.pushNamed repeatedly for root-level navigation creates an unbounded route stack and memory leaks.
**Action:** Use Navigator.pushNamedAndRemoveUntil when returning to root tabs to prevent memory leaks while preserving proper back-button behavior for deeper navigation.