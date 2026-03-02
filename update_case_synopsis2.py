import re

with open('lib/screens/case_synopsis_screen.dart', 'r') as f:
    content = f.read()

# Replace method calls with const widget instances for _buildLegalCard
content = re.sub(
    r"_buildLegalCard\(\n\s*context,\n\s*'Old IPC',\n\s*'Section 380',\n\s*'Theft in dwelling house, etc\.',\n\s*'→ BNS 305',\n\s*Colors\.red\[100\]!,\n\s*\)",
    r"_LegalCard(\n                  tag: 'Old IPC',\n                  title: 'Section 380',\n                  subtitle: 'Theft in dwelling house, etc.',\n                  mapping: '→ BNS 305',\n                  color: Colors.red[100]!,\n                )",
    content
)

content = re.sub(
    r"_buildLegalCard\(\n\s*context,\n\s*'New BNS',\n\s*'Section 305',\n\s*'Theft in a dwelling house',\n\s*null,\n\s*Colors\.green\[100\]!,\n\s*\)",
    r"_LegalCard(\n                  tag: 'New BNS',\n                  title: 'Section 305',\n                  subtitle: 'Theft in a dwelling house',\n                  mapping: null,\n                  color: Colors.green[100]!,\n                )",
    content
)

content = re.sub(
    r"_buildLegalCard\(\n\s*context,\n\s*'Procedure',\n\s*'CrPC 154',\n\s*'Information in cognizable cases',\n\s*'→ BNSS 173',\n\s*Colors\.blue\[100\]!,\n\s*\)",
    r"_LegalCard(\n                  tag: 'Procedure',\n                  title: 'CrPC 154',\n                  subtitle: 'Information in cognizable cases',\n                  mapping: '→ BNSS 173',\n                  color: Colors.blue[100]!,\n                )",
    content
)

# Remove the method and replace it with the class
method_start = content.find("  Widget _buildLegalCard(")
if method_start != -1:
    method_end = content.find("class _SummaryItem extends StatelessWidget {", method_start)
    if method_end != -1:
        # Remove the method from the class
        content = content[:method_start] + content[method_end:]

        # Add the class at the end of the file
        class_str = """
class _LegalCard extends StatelessWidget {
  final String tag;
  final String title;
  final String subtitle;
  final String? mapping;
  final Color color;

  const _LegalCard({
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.mapping,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (mapping != null)
                Text(
                  mapping!,
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
"""
        content += class_str

with open('lib/screens/case_synopsis_screen.dart', 'w') as f:
    f.write(content)

print("Updated lib/screens/case_synopsis_screen.dart")
