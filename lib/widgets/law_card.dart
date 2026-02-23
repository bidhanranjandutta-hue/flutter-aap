import 'package:flutter/material.dart';

/// A reusable card widget for displaying legal comparison data (e.g., IPC vs BNS).
///
/// [tag] - The short code or abbreviation (e.g., IPC, BNS).
/// [title] - The section title (e.g., Section 302).
/// [subtitle] - The full legal code name (e.g., Indian Penal Code).
/// [content] - The text of the law.
/// [isOld] - Boolean to style the card as legacy (gray) or new (primary color).
/// [highlight] - If true, applies specific highlighting to new clauses (like Mob Lynching).
class LawCard extends StatelessWidget {
  final String tag;
  final String title;
  final String subtitle;
  final String content;
  final bool isOld;
  final bool highlight;

  const LawCard({
    super.key,
    required this.tag,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.isOld,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isOld
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isOld
              ? Theme.of(context).dividerColor
              : Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isOld
                          ? Colors.grey[200]
                          : Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: isOld
                            ? Colors.grey[600]
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  if (!isOld)
                    IconButton(
                      icon: Icon(
                        Icons.bookmark_border,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.grey),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: isOld
                      ? Colors.grey[300]!
                      : Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
            child: highlight
                ? RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        fontSize: 14,
                        height: 1.5,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              "(1) Whoever commits murder shall be punished with death or imprisonment for life, and shall also be liable to fine.\n\n",
                        ),
                        const TextSpan(text: "(2) "),
                        TextSpan(
                          text:
                              "When a group of five or more persons acting in concert commits murder on the ground of race, caste or community, sex, place of birth, language, personal belief or any other similar ground, each member of such group shall be punished with death or with imprisonment for life, and shall also be liable to fine.",
                          style: TextStyle(
                            backgroundColor: Colors.green.withOpacity(0.1),
                            color: Colors.green[800],
                          ),
                        ),
                      ],
                    ),
                  )
                : Text(
                    content,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
          ),
          if (!isOld) ...[
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    border: Border.all(color: Colors.green[100]!),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Added: Mob Lynching Clause',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Active Law',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
