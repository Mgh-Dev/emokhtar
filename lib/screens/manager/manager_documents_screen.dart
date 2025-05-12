import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data'; // Add this import for Uint8List

class ManagerDocumentsScreen extends StatelessWidget {
  final List<Map<String, String>> documents = [
    {
      'title': 'نموذج الموافقة',
      'description': 'نموذج رسمي للموافقة على الطلبات',
      'template': 'approval_template'
    },
    {
      'title': 'إيصال دفع',
      'description': 'نموذج لإيصالات الدفع',
      'template': 'receipt_template'
    },
    {
      'title': 'تقرير شهري',
      'description': 'نموذج للتقرير الشهري',
      'template': 'monthly_report'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE8F5E9), // Light green
        title: Text('المستندات', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(documents[index]['title']!),
              subtitle: Text(documents[index]['description']!),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.preview),
                    onPressed: () => _previewDocument(context, documents[index]),
                  ),
                  IconButton(
                    icon: Icon(Icons.print),
                    onPressed: () => _printDocument(documents[index]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _previewDocument(BuildContext context, Map<String, String> doc) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(title: Text(doc['title']!)),
          body: PdfPreview(
            build: (format) => _generatePdf(doc),
          ),
        ),
      ),
    );
  }

  Future<void> _printDocument(Map<String, String> doc) async {
    await Printing.layoutPdf(
      onLayout: (format) => _generatePdf(doc),
    );
  }

  Future<Uint8List> _generatePdf(Map<String, String> doc) async {
    final pdf = pw.Document();
    
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            children: [
              pw.Header(level: 0, text: doc['title']!),
              pw.Paragraph(text: doc['description']!),
              pw.Divider(),
              pw.Text('نموذج رسمي - ${DateTime.now().toString()}'),
            ],
          );
        },
      ),
    );
    
    return pdf.save();
  }
}