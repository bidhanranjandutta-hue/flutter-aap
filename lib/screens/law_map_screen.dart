import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/law_card.dart';
import '../widgets/info_box.dart';
import '../data/law_mapping_db.dart';

/// Screen for displaying the compatibility map between Old Laws (IPC) and New Laws (BNS).
///
/// Provides a side-by-side comparison, highlighting key changes and AI-driven insights.
class LawMapScreen extends StatefulWidget {
  final String? initialQuery;
  const LawMapScreen({super.key, this.initialQuery});

  @override
  State<LawMapScreen> createState() => _LawMapScreenState();
}

class _LawMapScreenState extends State<LawMapScreen> {
  int _selectedSegment = 0;
  late TextEditingController _searchController;
  LawMappingRelation? _currentMapping;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: widget.initialQuery ?? "IPC 302",
    );
    _performSearch(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      _currentMapping = LawMappingDb.search(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Law Compatibility Map',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).cardColor,
        elevation: 1,
        actions: [
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Search Input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Theme.of(context).cardColor,
            child: TextField(
              controller: _searchController,
              onSubmitted: _performSearch,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search old laws (e.g. IPC 302, CrPC 41)...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.mic, color: AppTheme.primary),
                  onPressed: () {},
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          // Segmented Control
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Theme.of(context).cardColor,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  _buildSegmentButton(0, 'Comparison'),
                  _buildSegmentButton(1, 'Full Text'),
                  _buildSegmentButton(2, 'Case Law'),
                ],
              ),
            ),
          ),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (_currentMapping == null)
                    const Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Center(
                        child: Text(
                          'No mapping found. Try "IPC 302" or "CrPC 41".',
                        ),
                      ),
                    )
                  else ...[
                    // Result Header Card
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.primary, Colors.blue],
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
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_currentMapping!.oldLaw != null)
                                  _buildLawHeader(
                                    context,
                                    'Old Law',
                                    '${_currentMapping!.oldLaw!.act} ${_currentMapping!.oldLaw!.sectionNumber}',
                                    'Legacy Code',
                                    Colors.white,
                                  ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                if (_currentMapping!.newLaw != null)
                                  _buildLawHeader(
                                    context,
                                    'New Law',
                                    '${_currentMapping!.newLaw!.act} ${_currentMapping!.newLaw!.sectionNumber}',
                                    '2023 Sanhita',
                                    Colors.greenAccent,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Divider(color: Colors.white24),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.gavel,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _currentMapping!.newLaw?.sectionTitle ??
                                        _currentMapping!.oldLaw?.sectionTitle ??
                                        '',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // AI Insight Badge
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.amber[50],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.amber[100]!),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.amber[100],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.lightbulb,
                                color: Colors.amber[800],
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AI Insight: Key Change',
                                    style: TextStyle(
                                      color: Colors.amber[800],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _currentMapping!.mappingNotes,
                                    style: const TextStyle(
                                      color: Colors.black87,
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
                    const SizedBox(height: 16),
                    // Comparison Cards (Refactored to use LawCard widget)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          if (_currentMapping!.oldLaw != null) ...[
                            LawCard(
                              tag: _currentMapping!.oldLaw!.act,
                              title:
                                  'Section ${_currentMapping!.oldLaw!.sectionNumber}',
                              subtitle: _currentMapping!.oldLaw!.sectionTitle,
                              content:
                                  _currentMapping!.oldLaw!.sectionDescription,
                              isOld: true,
                            ),
                            const SizedBox(height: 8),
                            const Icon(
                              Icons.arrow_downward,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 8),
                          ],
                          if (_currentMapping!.newLaw != null)
                            LawCard(
                              tag: _currentMapping!.newLaw!.act,
                              title:
                                  'Section ${_currentMapping!.newLaw!.sectionNumber}',
                              subtitle: _currentMapping!.newLaw!.sectionTitle,
                              content:
                                  _currentMapping!.newLaw!.sectionDescription,
                              isOld: false,
                              highlight: true,
                            ),
                        ],
                      ),
                    ),
                    // Additional Info (Refactored to use InfoBox widget)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: InfoBox(
                              label: 'Old Penalty',
                              value:
                                  _currentMapping!.oldLaw?.punishment ?? 'N/A',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: InfoBox(
                              label: 'New Penalty',
                              value:
                                  _currentMapping!.newLaw?.punishment ?? 'N/A',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  // AI Disclaimer
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'AI-generated assistance. Verify with official gazette.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  // Offline Indicator
                  const Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'DATABASE OFFLINE READY',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).cardColor,
        foregroundColor: Theme.of(context).iconTheme.color,
        child: const Icon(Icons.save_alt),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2, // Law Map
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Cases'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Law Map'),
          BottomNavigationBarItem(icon: Icon(Icons.gavel), label: 'BNS Guide'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/dashbord');
        },
      ),
    );
  }

  Widget _buildSegmentButton(int index, String text) {
    bool isSelected = _selectedSegment == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSegment = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).cardColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                    ),
                  ]
                : [],
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? AppTheme.primary : Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLawHeader(
    BuildContext context,
    String label,
    String code,
    String subLabel,
    Color badgeColor,
  ) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          code,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
            border: badgeColor == Colors.greenAccent
                ? Border.all(color: Colors.greenAccent.withOpacity(0.5))
                : null,
          ),
          child: Text(
            subLabel,
            style: TextStyle(
              color: badgeColor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
