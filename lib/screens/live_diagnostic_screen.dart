import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/diagnostic_service.dart';
import '../services/devops_service.dart';

class LiveDiagnosticScreen extends StatefulWidget {
  const LiveDiagnosticScreen({super.key});

  @override
  State<LiveDiagnosticScreen> createState() => _LiveDiagnosticScreenState();
}

class _LiveDiagnosticScreenState extends State<LiveDiagnosticScreen> {
  final TextEditingController _issueController = TextEditingController();
  final DiagnosticService _diagnosticService = DiagnosticService();
  final DevOpsService _devOpsService = DevOpsService();

  bool _isRecording = false;
  bool _hasScreenshot = false;
  bool _isSubmitting = false;

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
    });
    if (_isRecording) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Screen recording started... (Simulated)'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Screen recording saved. (Simulated)')),
      );
    }
  }

  void _captureScreenshot() {
    setState(() {
      _hasScreenshot = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Screenshot captured. Ready for markup. (Simulated)'),
      ),
    );
  }

  Future<void> _submitReport() async {
    if (_issueController.text.trim().isEmpty &&
        !_hasScreenshot &&
        !_isRecording) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please describe the issue or attach media.'),
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      // 1. Generate Dossier via @LiveDiagnosticAgent
      final dossier = await _diagnosticService.generateBugDossier(
        userComplaint: _issueController.text,
        hasScreenshot: _hasScreenshot,
        hasVideo: _isRecording, // Assume stopped for this logic
      );

      // 2. Send to @AutoDevOpsAgent Cloud Function (Simulated)
      await _devOpsService.receiveBugDossier(dossier);

      if (mounted) {
        // Show empathy/translation response
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Report Submitted'),
            content: const Text(
              'आपकी समस्या समझ ली गई है और इंजीनियरिंग टीम को भेज दी गई है।\n\n(Your issue has been understood and sent to the engineering team.)',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Close screen
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  void dispose() {
    _issueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Problem Solving'),
        backgroundColor: AppTheme.secondary, // Stand out from main app
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Describe your issue (Any Language):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _issueController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText:
                    'e.g., ऐप क्रैश हो गया है जब मैं FIR अपलोड कर रहा था...',
                border: const OutlineInputBorder(),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.mic, color: AppTheme.primary),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Voice input activated (Simulated)'),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Visual Context (Required for auto-fix):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _captureScreenshot,
                    icon: Icon(
                      _hasScreenshot ? Icons.check_circle : Icons.screenshot,
                    ),
                    label: const Text('Screenshot'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _hasScreenshot
                          ? Colors.green
                          : AppTheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _toggleRecording,
                    icon: Icon(
                      _isRecording ? Icons.stop_circle : Icons.screen_share,
                    ),
                    label: Text(_isRecording ? 'Stop Rec.' : 'Record Screen'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isRecording
                          ? Colors.red
                          : AppTheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
            if (_hasScreenshot) ...[
              const SizedBox(height: 16),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Center(
                  child: Text(
                    'Screenshot Preview (Markup enabled)',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submitReport,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _isSubmitting
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Submit Diagnostic Report',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
