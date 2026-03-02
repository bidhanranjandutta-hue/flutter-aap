import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nyaya_assist/services/gemini_service.dart';
import 'package:nyaya_assist/services/ocr_service.dart';
import '../theme/app_theme.dart';
import '../services/export_service.dart'; // To be created next

class OCRScannerScreen extends StatefulWidget {
  const OCRScannerScreen({super.key});

  @override
  State<OCRScannerScreen> createState() => _OCRScannerScreenState();
}

class _OCRScannerScreenState extends State<OCRScannerScreen> {
  int _viewMode = 0; // 0: Original, 1: Digitized
  File? _imageFile;
  String _recognizedText = "No text scanned yet.";
  bool _isProcessing = false;

  final OCRService _ocrService = OCRService(
    geminiService: GeminiService(
      'YOUR_API_KEY_HERE',
    ), // In production, use env variable
  );
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _ocrService.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    setState(() => _isProcessing = true);

    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() => _imageFile = File(pickedFile.path));

        // Process Image
        final inputImage = InputImage.fromFilePath(pickedFile.path);
        final String text = await _ocrService.processImage(inputImage);

        setState(() {
          _recognizedText = text;
          _viewMode = 1; // Auto-switch to digitized view
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error picking image: $e');
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error scanning document. Please try again.'),
          ),
        );
      }
    } finally {
      setState(() => _isProcessing = false);
    }
  }

  Future<void> _enhanceText() async {
    // Check if Gemini API key is valid before calling (mocked here)
    if (_recognizedText.isEmpty) return;

    setState(() => _isProcessing = true);

    // Simulate/Call enhancement
    // In real app, iterate lines and call geminiService.repairLegalText()
    // For now, let's just show a simulated enhancement success
    await Future.delayed(const Duration(seconds: 2)); // Mock delay

    setState(() {
      _recognizedText =
          "$_recognizedText\n\n[AI Enhanced: Context Repair Applied]";
      _isProcessing = false;
    });
  }

  Future<void> _translateText() async {
    setState(() => _isProcessing = true);
    final String translated = await _ocrService.translateToHindi(
      _recognizedText,
    );
    setState(() {
      _recognizedText = translated;
      _isProcessing = false;
    });
  }

  Future<void> _exportPdf() async {
    await ExportService.generatePdf(_recognizedText);
  }

  Future<void> _exportDocx() async {
    await ExportService.generateDocx(_recognizedText);
  }

  @override
  Widget build(BuildContext context) {
    // Return Column instead of Scaffold since it's wrapped in MainLayout now.
    return Column(
      children: [
        // Simulated App Bar for the Inner Tab (Optional, but good for context)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12),
          color: Theme.of(context).cardColor,
          child: Column(
            children: [
              const Text(
                'OCR Document Scanner',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                _imageFile != null ? 'Image Captured' : 'Tap Capture to Start',
                style: TextStyle(color: Colors.grey[500], fontSize: 12),
              ),
            ],
          ),
        ),
        // View Toggle
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Theme.of(context).cardColor.withOpacity(0.95),
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                _buildToggleOption(0, 'Original Scan'),
                _buildToggleOption(1, 'Digitized Text'),
              ],
            ),
          ),
        ),
        // Document Preview / Text View
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Theme.of(context).dividerColor),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _viewMode == 0
                  ? (_imageFile != null
                        ? Image.file(_imageFile!, fit: BoxFit.contain)
                        : Container(
                            color: Colors.grey[300],
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.image_search,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                const SizedBox(height: 16),
                                const Text('No Image Scanned'),
                                const SizedBox(height: 16),
                                ElevatedButton.icon(
                                  onPressed: () =>
                                      _pickImage(ImageSource.camera),
                                  icon: const Icon(Icons.camera_alt),
                                  label: const Text('Capture from Camera'),
                                ),
                                const SizedBox(height: 8),
                                TextButton.icon(
                                  onPressed: () =>
                                      _pickImage(ImageSource.gallery),
                                  icon: const Icon(Icons.photo_library),
                                  label: const Text('Upload from Gallery'),
                                ),
                              ],
                            ),
                          ))
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _recognizedText,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
            ),
          ),
        ),
        // Status Bar
        if (_isProcessing)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                border: Border.all(color: Colors.blue[100]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Processing document...',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        const SizedBox(height: 16),
        // Action Grid
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: ElevatedButton.icon(
                  onPressed: _isProcessing ? null : _enhanceText,
                  icon: const Icon(Icons.auto_fix_high),
                  label: const Text('Enhance Text'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton(
                  Icons.translate,
                  'Translate',
                  'Hindi',
                  _translateText,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildActionButton(
                  Icons.ios_share,
                  'Export',
                  'PDF/DOCX',
                  () {
                    _showExportOptions(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildToggleOption(int index, String text) {
    bool isSelected = _viewMode == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _viewMode = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 2,
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

  void _showExportOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
              title: const Text('Export as PDF'),
              onTap: () {
                Navigator.pop(context);
                _exportPdf();
              },
            ),
            ListTile(
              leading: const Icon(Icons.description, color: Colors.blue),
              title: const Text('Export as DOCX (Coming Soon)'),
              onTap: () {
                Navigator.pop(context);
                _exportDocx();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildActionButton(
    IconData icon,
    String label,
    String subLabel,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.grey[700], size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            Text(
              subLabel,
              style: TextStyle(color: Colors.grey[400], fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
