import 'package:flutter/foundation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
// import 'package:docx_template/docx_template.dart'; // Commented out for now as usage requires template asset

class ExportService {
  /// Generates and shares/prints a PDF document containing the recognized text.
  static Future<void> generatePdf(String text) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(child: pw.Text(text));
        },
      ),
    );

    try {
      await Printing.layoutPdf(onLayout: (format) async => pdf.save());
    } catch (e) {
      if (kDebugMode) {
        print('Error generating PDF: $e');
      }
    }
  }

  /// Placeholder for DOCX export.
  /// Requires a template asset file to be loaded first.
  static Future<void> generateDocx(String text) async {
    // Load template
    // final data = await rootBundle.load('assets/template.docx');
    // final docx = await DocxTemplate.fromBytes(data.buffer.asUint8List());

    // Content content = Content();
    // content.add(TextContent("content", text));

    // final d = await docx.generate(content);
    // final file = File('generated.docx');
    // await file.writeAsBytes(d!);
    if (kDebugMode) {
      print("DOCX export not fully implemented (requires template asset).");
    }
  }
}
