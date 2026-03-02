with open('lib/screens/case_synopsis_screen.dart', 'r') as f:
    lines = f.readlines()

new_lines = []
for i, line in enumerate(lines):
    if line.strip() == "class _SummaryItem extends StatelessWidget {" and lines[i-1].strip() == "}":
        new_lines.insert(-1, "}\n\n") # This is not correct, I should add a closing bracket before class _SummaryItem. Wait, the problem is that there's no closing bracket for `class _CaseSynopsisScreenState`.
        pass
    new_lines.append(line)

# Let's just fix it properly. We need a closing bracket for `_CaseSynopsisScreenState` before `class _SummaryItem` starts.
content = "".join(lines)
content = content.replace("    );\n  }\n\nclass _SummaryItem", "    );\n  }\n}\n\nclass _SummaryItem")

with open('lib/screens/case_synopsis_screen.dart', 'w') as f:
    f.write(content)
