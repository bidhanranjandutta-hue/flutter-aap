import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../theme/app_theme.dart';
import '../models/case_synopsis_model.dart';
import '../services/gemini_service.dart';

class CaseSynopsisScreen extends StatefulWidget {
  const CaseSynopsisScreen({super.key});

  @override
  State<CaseSynopsisScreen> createState() => _CaseSynopsisScreenState();
}

class _CaseSynopsisScreenState extends State<CaseSynopsisScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = false;
  CaseSynopsisModel? _synopsis;

  // In production, inject this or get from a provider
  final GeminiService _geminiService = GeminiService('YOUR_API_KEY_HERE');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _handleUpload() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'txt', 'jpg', 'png'],
    );

    if (result != null) {
      setState(() => _isLoading = true);

      try {
        // Simulate reading text from the file (in reality, use OCR or PDF text extraction)
        // For demonstration, we use a mock FIR text to send to Gemini
        String mockFirText = """
        FIR No: 102/2023. Date: 14/10/2023. Time: 05:30 AM.
        Complainant Ramesh reported that between 2 AM and 4 AM, unknown persons broke the lock of his house in Sector 4 and stole gold ornaments and cash.
        """;

        String? jsonResponse = await _geminiService.generateCaseSynopsis(
          mockFirText,
        );

        if (jsonResponse != null) {
          setState(() {
            _synopsis = CaseSynopsisModel.fromJson(jsonResponse);
          });
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to generate synopsis.')),
          );
        }
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Case Synopsis',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 1,
        actions: [
          IconButton(icon: const Icon(Icons.history), onPressed: () {}),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: 100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upload Section
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      // Dashed border simulated as solid for simplicity
                      color: AppTheme.primary.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.upload_file,
                          color: AppTheme.primary,
                          size: 32,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Upload Case File',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tap to scan or upload FIR (PDF, JPG)',
                        style: TextStyle(color: Colors.grey[500], fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _handleUpload,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text('Select File'),
                      ),
                    ],
                  ),
                ),
                if (_synopsis != null) ...[
                  const SizedBox(height: 24),
                  // Smart Summary Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.psychology, color: AppTheme.primary),
                          const SizedBox(width: 8),
                          const Text(
                            'Smart Summary',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.thumb_up_outlined, size: 20),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.thumb_down_outlined,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Theme.of(context).dividerColor),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          controller: _tabController,
                          labelColor: AppTheme.primary,
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: AppTheme.primary,
                          tabs: const [
                            Tab(text: 'Subject'),
                            Tab(text: 'Situation'),
                            Tab(text: 'Position'),
                          ],
                        ),
                        SizedBox(
                          height: 200,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              // Subject Tab (5Ws)
                              ListView(
                                padding: const EdgeInsets.all(16),
                                children: _synopsis!.fiveWs.entries
                                    .map(
                                      (e) => Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 12,
                                        ),
                                        child: _buildSummaryItem(
                                          Icons.info_outline,
                                          e.key,
                                          e.value,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              // Situation Tab
                              ListView(
                                padding: const EdgeInsets.all(16),
                                children: [
                                  _buildSummaryItem(
                                    Icons.gavel,
                                    'Subject',
                                    _synopsis!.analysis['Subject'] ?? 'N/A',
                                  ),
                                  const SizedBox(height: 12),
                                  _buildSummaryItem(
                                    Icons.place,
                                    'Situation',
                                    _synopsis!.analysis['Situation'] ?? 'N/A',
                                  ),
                                ],
                              ),
                              // Position Tab
                              ListView(
                                padding: const EdgeInsets.all(16),
                                children: [
                                  _buildSummaryItem(
                                    Icons.balance,
                                    'Position',
                                    _synopsis!.analysis['Position'] ?? 'N/A',
                                  ),
                                  const SizedBox(height: 12),
                                  _buildSummaryItem(
                                    Icons.warning,
                                    'Condition',
                                    _synopsis!.analysis['Condition'] ?? 'N/A',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Suggested Legal Sections
                  Row(
                    children: [
                      const Icon(Icons.book, color: AppTheme.primary),
                      const SizedBox(width: 8),
                      const Text(
                        'Suggested Legal Sections',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ..._synopsis!.suggestedSections.map(
                    (section) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildLegalCard(
                        context,
                        section.act,
                        'Section ${section.section}',
                        section.title,
                        section.mapping.isNotEmpty ? section.mapping : null,
                        AppTheme.primary,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (_synopsis != null)
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.ios_share),
                  label: const Text('Export Report'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).primaryColorDark, // Use dark color for contrast
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: const StadiumBorder(),
                  ),
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // Analysis
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Analysis',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (index) {
          if (index == 0) Navigator.pushNamed(context, '/dashbord');
        },
      ),
    );
  }

  Widget _buildSummaryItem(IconData icon, String title, String content) {
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

  Widget _buildLegalCard(
    BuildContext context,
    String tag,
    String title,
    String subtitle,
    String? mapping,
    Color color,
  ) {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        color: color,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Icon(Icons.chevron_right, color: Colors.grey[300]),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          if (mapping != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.compare_arrows,
                    size: 16,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    mapping,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
