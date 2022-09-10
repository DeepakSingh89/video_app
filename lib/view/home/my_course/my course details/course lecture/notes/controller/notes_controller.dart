import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:get/get.dart';

class NotesController extends GetxController with StateMixin<PDFDocument> {
  @override
  void onInit() async {
    callGetDocument();
    super.onInit();
  }

  callGetDocument() async {
    String url = Get.arguments;
    PDFDocument.fromURL(url).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}
