import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/tool_card.dart';
import '../widgets/file_item_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.only(
              top: 48,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.9),
              border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.person, color: Colors.grey),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'WELCOME BACK',
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    letterSpacing: 1.0,
                                  ),
                            ),
                            Text(
                              'Inspector Sharma',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notifications_outlined),
                          onPressed: () {},
                        ),
                        Positioned(
                          right: 12,
                          top: 12,
                          child: Container(
                            height: 8,
                            width: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search FIRs, statutes, or people...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.mic, color: AppTheme.primary),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ],
            ),
          ),
          // Main Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Actions Grid
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AI Tools',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('View All'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        // OCR Card
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/ocr'),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [AppTheme.primary, Color(0xFF2B71FA)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.primary.withOpacity(0.3),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.document_scanner,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'OCR Evidence Scanner',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Extract text from FIRs & handwritten notes instantly.',
                                        style: TextStyle(
                                          color: Colors.blue[100],
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            // Case Synopsis
                            Expanded(
                              child: ToolCard(
                                title: 'Case Synopsis',
                                subtitle: 'Generate summary',
                                icon: Icons.summarize,
                                iconColor: Colors.purple,
                                iconBgColor: Colors.purple[50]!,
                                onTap: () =>
                                    Navigator.pushNamed(context, '/synopsis'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Law Map
                            Expanded(
                              child: ToolCard(
                                title: 'Law Map',
                                subtitle: 'IPC ⇄ BNS',
                                icon: Icons.compare_arrows,
                                iconColor: Colors.orange,
                                iconBgColor: Colors.orange[50]!,
                                onTap: () =>
                                    Navigator.pushNamed(context, '/law_map'),
                                badge: 'New',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Recent Activity Feed
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Recent Case Files',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.add_to_drive, size: 16),
                              label: const Text('Drive'),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        const FileItemCard(
                          title: 'FIR_2023_0912_Theft.pdf',
                          subtitle: 'Edited 10m ago • Case #402',
                          icon: Icons.picture_as_pdf,
                          iconColor: Colors.red,
                        ),
                        const SizedBox(height: 12),
                        const FileItemCard(
                          title: 'Witness_Statement_Rao.docx',
                          subtitle: 'Edited 1h ago • Case #398',
                          icon: Icons.description,
                          iconColor: Colors.blue,
                        ),
                        const SizedBox(height: 12),
                        const FileItemCard(
                          title: 'Evidence_Photos_Site_B',
                          subtitle: 'Created yesterday • 12 items',
                          icon: Icons.folder,
                          iconColor: Colors.amber,
                        ),
                        const SizedBox(height: 12),
                        const FileItemCard(
                          title: 'BNS_Reference_Draft_v2.pdf',
                          subtitle: 'Edited 2 days ago • Personal',
                          icon: Icons.picture_as_pdf,
                          iconColor: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'My Cases'),
          BottomNavigationBarItem(
            icon: Icon(Icons.center_focus_weak),
            label: 'Scan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Tools'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, '/ocr');
          }
        },
      ),
    );
  }
}
