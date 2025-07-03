import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_viewer/controller/pdf_controller.dart';

class PdfViewer extends StatelessWidget {
  final String pdfUrl;
  const PdfViewer({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    var pdfController = Get.put(PdfController());

    return const Placeholder();
  }
}
