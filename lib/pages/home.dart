import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_viewer/controller/intent_controller.dart';
import 'package:pdf_viewer/pages/pdf_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final IntentController intentController = Get.put(IntentController());

    return Scaffold(
      appBar: AppBar(title: Text("PDF Reader")),
      body: Obx(() {
        if (intentController.sharedPdfPath.value == "") {
          return Center(
            child: Text(
              "Nessun PDF ricevuto, per usare l'app è necessario aprire un PDF e selezionare l'app come predefinita",
            ).tr(),
          );
        } else {
          return PdfViewer(pdfUrl: intentController.sharedPdfPath.value);
        }
      }),
    );
  }
}
