import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class PdfController extends GetxController {
  PdfViewerController pdfViewerController = PdfViewerController();
  TextEditingController searchController = TextEditingController();
  PdfTextSearchResult searchResult = PdfTextSearchResult();

  void searchText(String text) {
    searchResult = pdfViewerController.searchText(text);
  }

  void cleanSearch() {
    searchController.clear();
    searchResult.clear();
  }

  void zoomIn() {
    pdfViewerController.zoomLevel += 0.25;
  }

  void zoomOut() {
    if (pdfViewerController.zoomLevel > 1) {
      pdfViewerController.zoomLevel -= 0.25;
    }
  }
}
