import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_viewer/controller/pdf_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatelessWidget {
  final String pdfUrl;
  const PdfViewer({super.key, required this.pdfUrl});

  @override
  Widget build(BuildContext context) {
    var pdfController = Get.put(PdfController());

    return Scaffold(
      appBar: AppBar(
        title: Text("File name"),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => pdfController.pdfViewerController.previousPage(),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => pdfController.pdfViewerController.nextPage(),
          ),
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: pdfController.zoomIn,
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: pdfController.zoomOut,
          ),
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: pdfController.cleanSearch,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: pdfController.searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: pdfController.searchText,
              decoration: InputDecoration(
                hint: Text("Cerca nel PDF").tr(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => pdfController.searchText(
                    pdfController.searchController.text,
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: SfPdfViewer.file(File(pdfUrl)),
    );
  }
}
