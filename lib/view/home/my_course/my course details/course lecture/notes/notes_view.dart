import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:raghu_education/import_files.dart';
import 'controller/notes_controller.dart';

class NotesView extends GetView<NotesController> {
  NotesController notesController = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:controller.obx((state)=> PDFViewer(document: state!)),
    );
  }
}
