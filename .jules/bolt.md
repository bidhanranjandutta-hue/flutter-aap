## 2024-05-24 - [TextEditingController Memory Leak]
**Learning:** Instantiating disposable controllers directly inside a StatefulWidget's build method is an anti-pattern that causes memory leaks and state loss on UI rebuilds.
**Action:** Always initialize controllers like TextEditingController in initState and clean them up in dispose.
