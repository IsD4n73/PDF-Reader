import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class IntentController extends GetxController {
  RxString sharedPdfPath = "".obs;

  Future<void> getPdfPath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      sharedPdfPath.value = result.files.single.path!;
    }
  }

  @override
  void onInit() {
    super.onInit();

    ReceiveSharingIntent.instance.getMediaStream().listen((
      List<SharedMediaFile> value,
    ) {
      sharedPdfPath.value = value.isNotEmpty ? value[0].path : "";
    });

    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      sharedPdfPath.value = value.isNotEmpty ? value[0].path : "";
    });
  }
}
