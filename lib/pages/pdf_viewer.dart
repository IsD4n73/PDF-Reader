import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewer extends StatefulWidget {
  final String pdfUrl;
  const PdfViewer({super.key, required this.pdfUrl});

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  PdfViewerController pdfViewerController = PdfViewerController();
  TextEditingController searchController = TextEditingController();
  PdfTextSearchResult searchResult = PdfTextSearchResult();

  @override
  void initState() {
    super.initState();
  }

  void _searchText(String text) {
    searchResult = pdfViewerController.searchText(text);
    searchResult.addListener(() => setState(() {}));
    setState(() {});
  }

  void _clearSearch() {
    searchResult.clear();
    searchController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          File(widget.pdfUrl).uri.pathSegments.last,
          overflow: TextOverflow.ellipsis,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => pdfViewerController.previousPage(),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => pdfViewerController.nextPage(),
          ),
          IconButton(
            icon: const Icon(Icons.zoom_in),
            onPressed: () {
              pdfViewerController.zoomLevel += 0.25;
            },
          ),
          IconButton(
            icon: const Icon(Icons.zoom_out),
            onPressed: () {
              if (pdfViewerController.zoomLevel > 1) {
                pdfViewerController.zoomLevel -= 0.25;
              }
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: _searchText,
              decoration: InputDecoration(
                hint: Text("Cerca nel PDF").tr(),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => _searchText(searchController.text),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          if (searchResult.hasResult)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_upward),
                    onPressed: () {
                      searchResult.previousInstance();
                    },
                  ),
                  Text(
                    '${searchResult.currentInstanceIndex} di ${searchResult.totalInstanceCount}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_downward),
                    onPressed: () {
                      searchResult.nextInstance();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: _clearSearch,
                  ),
                ],
              ),
            ),
          Expanded(
            child: SfPdfViewer.file(
              File(widget.pdfUrl),
              controller: pdfViewerController,
              canShowPageLoadingIndicator: true,
              canShowScrollStatus: true,
              canShowPasswordDialog: true,
              enableDoubleTapZooming: true,
              enableTextSelection: true,
            ),
          ),
        ],
      ),
    );
  }
}
