import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class PdfController extends GetxController {
  PdfViewerController pdfViewerController = PdfViewerController();
  TextEditingController searchController = TextEditingController();
  Rx<PdfTextSearchResult> searchResult = PdfTextSearchResult().obs;
  RxBool hasSearchingResult = false.obs;

  void searchText(String text) {
    searchResult.value = pdfViewerController.searchText(text);
    searchResult.value.addListener(() {
      hasSearchingResult.value = true;
    });
  }

  void cleanSearch() {
    searchController.clear();
    searchResult.value.clear();
    hasSearchingResult.value = false;
  }

  void zoomIn() {
    pdfViewerController.zoomLevel += 0.25;
  }

  void zoomOut() {
    if (pdfViewerController.zoomLevel > 1) {
      pdfViewerController.zoomLevel -= 0.25;
    }
  }

  void nextSearch() => searchResult.value.nextInstance();
  void prevSearch() => searchResult.value.previousInstance();
}
