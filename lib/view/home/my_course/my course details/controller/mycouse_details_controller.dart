import 'package:get/get.dart';
import 'package:raghu_education/services/api_client.dart';
import 'package:raghu_education/services/api_provider/get_course_endpoint_provider.dart';
import 'package:raghu_education/view/home/home_page/home_module/get_all_course_model.dart';

class MyCoursesDetailsController extends GetxController
    with StateMixin<GetCourseModel> {
  String id = Get.arguments["id"];
  bool isMyCourse = Get.arguments["isMyCourse"];

  callGetCourseByIdApi() {
    Client client = Client();
    CourseProvider courseProvider = CourseProvider(client: client.init());
    courseProvider.getCourseByIdApi(Id: id).then((value) {
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onInit() {
    callGetCourseByIdApi();
    super.onInit();
  }
}
