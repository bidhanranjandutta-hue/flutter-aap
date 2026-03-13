## 2024-05-24 - [Flutter] Cached TextEditingController to prevent rebuild allocation
**Learning:** Found a TextEditingController being instantiated directly in a build() method. This causes a new controller allocation every time the widget rebuilds, and leads to lost state (like cursor position or current text) on lateral rebuilds.
**Action:** Always allocate TextEditingControllers in initState(), cache them in a state variable, and dispose of them in dispose() to prevent memory leaks and unnecessary allocations.
