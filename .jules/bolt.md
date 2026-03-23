## 2024-05-18 - [Isolating Local State Rebuilds]
**Learning:** Having local ephemeral state (like the currently selected tab in a segmented control) managed at the root of a large screen widget using `setState` causes the entire screen to rebuild when the state changes. This is a common Flutter anti-pattern that leads to unnecessary diffing and rendering overhead.

**Action:** Whenever I encounter a large `StatefulWidget` where `setState` only modifies a small, localized UI component, I will extract that specific component into its own `StatefulWidget`. This isolates rebuilds to just the affected node, significantly improving rendering performance during user interaction.
