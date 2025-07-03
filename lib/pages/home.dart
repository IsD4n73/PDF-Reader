import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf_viewer/controller/intent_controller.dart';
import 'package:pdf_viewer/pages/pdf_viewer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final IntentController intentController = Get.put(IntentController());

    return Scaffold(
      body: Obx(() {
        if (intentController.sharedPdfPath.value == "") {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nessun PDF ricevuto, per usare l'app è necessario aprire un PDF e selezionare l'app come predefinita",
                textAlign: TextAlign.center,
              ).tr(),
              SizedBox(height: 40),
              OutlinedButton(
                onPressed: () async {
                  BotToast.showLoading();
                  await intentController.getPdfPath();
                  BotToast.closeAllLoading();
                },
                child: Text("Apri PDF"),
              ),
            ],
          );
        } else {
          return PdfViewer(pdfUrl: intentController.sharedPdfPath.value);
        }
      }),
    );
  }
}
