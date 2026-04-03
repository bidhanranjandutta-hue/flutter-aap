## 2024-05-24 - Extracted ephemeral state to isolate rebuilds
**Learning:** In Flutter screens with complex static content, using `setState` at the root of a large screen widget for localized ephemeral state (like a selected tab index or view mode toggle) causes unnecessary rebuilds of the entire screen.
**Action:** Extract the localized UI component into its own `StatefulWidget` or use `ValueNotifier` to isolate rebuilds to just the affected node.
