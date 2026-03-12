import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/search_cache_service.dart';
import 'dashboard_screen.dart';
import 'law_map_screen.dart';
import 'ocr_scanner_screen.dart';
import 'live_diagnostic_screen.dart';

class MainLayout extends StatefulWidget {
  final int initialIndex;

  const MainLayout({super.key, this.initialIndex = 0});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late int _currentIndex;
  final TextEditingController _globalSearchController = TextEditingController();

  final List<Widget> _screens = [
    const DashboardScreen(),
    const OCRScannerScreen(),
    const LawMapScreen(),
    const Center(
      child: Text(
        'Profile Settings (Coming Soon)',
        style: TextStyle(fontSize: 18),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  void dispose() {
    _globalSearchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) async {
    if (query.trim().isNotEmpty) {
      await SearchCacheService.addSearch(query);
      if (mounted) {
        // Push to dedicated search result screen to maintain back navigation cleanly,
        // or switch index if we had a mechanism to pass args to the IndexedStack child.
        // Given UX simplicity, pushing route handles arguments best.
        Navigator.pushNamed(context, '/law_map', arguments: query.trim());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _globalSearchController,
          onSubmitted: _onSearch,
          textInputAction: TextInputAction.search,
          style: const TextStyle(color: Colors.white, fontSize: 16),
          decoration: InputDecoration(
            hintText: 'Search laws (e.g. IPC 302)...',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            prefixIcon: const Icon(Icons.search, color: Colors.white),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.white),
            onPressed: () {},
            tooltip: 'Voice Search',
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppTheme.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.local_police, size: 48, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'NyayaAssist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.summarize, size: 28),
              title: const Text(
                'Case Synopsis',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.pushNamed(context, '/synopsis');
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, size: 28),
              title: const Text('Sign Out', style: TextStyle(fontSize: 18)),
              onTap: () {
                // AuthService.signOut() would go here, then Navigator.pushReplacementNamed to '/'
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(index: _currentIndex, children: _screens),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LiveDiagnosticScreen(),
            ),
          );
        },
        backgroundColor: AppTheme.secondary,
        foregroundColor: Colors.white,
        tooltip: 'Live Problem Solving',
        child: const Icon(Icons.support_agent),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.document_scanner),
            label: 'Scan',
          ),
          NavigationDestination(icon: Icon(Icons.map), label: 'Law Map'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
