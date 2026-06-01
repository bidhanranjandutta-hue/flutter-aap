## 2026-06-01 - Unbounded Navigation Stacks
**Learning:** Flutter's Navigator.pushNamed inside BottomNavigationBar creates new instances of root-level screens, leading to unbounded navigation stacks and potential memory leaks during normal tab switching.
**Action:** Use Navigator.pushReplacementNamed for root-level tab switches to maintain a flat navigation stack. For authentication/login flows, use Navigator.pushNamedAndRemoveUntil(..., (route) => false) to explicitly clear the stack and free memory from unneeded welcome/auth screens.
