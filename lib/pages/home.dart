import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_viewer/controller/intent_controller.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final IntentController intentController = Get.put(IntentController());


    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Obx(() {
        if(intentController.sharedPdfPath.value == ""){
          return Center(
            child: Text("Nessun PDF ricevuto"),
          );
        }else{
          return SfPdfViewer.file(File(intentController.sharedPdfPath.value));
        }
      },),
    );
  }
}
