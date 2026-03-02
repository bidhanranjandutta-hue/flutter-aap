import re

with open('lib/screens/case_synopsis_screen.dart', 'r') as f:
    content = f.read()

# Replace method calls with const widget instances
content = re.sub(
    r"_buildSummaryItem\(\s*Icons\.gavel,\s*'Alleged Offence',\s*'([^']+)',\s*\)",
    r"const _SummaryItem(\n                              icon: Icons.gavel,\n                              title: 'Alleged Offence',\n                              content: '\1',\n                            )",
    content
)

content = re.sub(
    r"_buildSummaryItem\(\s*Icons\.schedule,\s*'Time of Occurrence',\s*'([^']+)',\s*\)",
    r"const _SummaryItem(\n                              icon: Icons.schedule,\n                              title: 'Time of Occurrence',\n                              content: '\1',\n                            )",
    content
)

# Remove the method and replace it with the class
method_start = content.find("  Widget _buildSummaryItem(IconData icon, String title, String content) {")
if method_start != -1:
    method_end = content.find("  Widget _buildLegalCard(", method_start)
    if method_end != -1:
        # Extract the method body
        method_str = content[method_start:method_end]

        # Remove the method from the class
        content = content[:method_start] + content[method_end:]

        # Add the class at the end of the file
        class_str = """
class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;

  const _SummaryItem({
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppTheme.primary, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
"""
        content += class_str

with open('lib/screens/case_synopsis_screen.dart', 'w') as f:
    f.write(content)

print("Updated lib/screens/case_synopsis_screen.dart")
