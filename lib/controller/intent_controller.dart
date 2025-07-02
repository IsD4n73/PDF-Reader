
import 'package:get/get.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class IntentController extends GetxController{
  RxString sharedPdfPath = "".obs;

  @override
  void onInit() {
    super.onInit();

    ReceiveSharingIntent.instance.getMediaStream().listen((List<SharedMediaFile> value){
      sharedPdfPath.value = value.isNotEmpty ? value[0].path : "";
    });

    ReceiveSharingIntent.instance.getInitialMedia().then((value) {
      sharedPdfPath.value = value.isNotEmpty ? value[0].path : "";
    },);

  }
}