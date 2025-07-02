import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class PdfController extends GetxController {
  late PdfViewerController pdfViewerController;
  late TextEditingController searchController;
  PdfTextSearchResult searchResult = PdfTextSearchResult();
}
