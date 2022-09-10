import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/welocome/onboarding_screen.dart';
import 'package:raghu_education/constants/constant.dart';

class FirstOnboardController extends GetxController {
  PageController controller = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;
  onPageChanged(int index) {
    currentPage.value = index;
  }

  nextPage() {
    controller.animateToPage(controller.page!.toInt() + 1,
        duration: Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  isLogin() async {
    GetStorage box = GetStorage();
    String? tempToken = await box.read("token");
    if (tempToken != null) {
      token = tempToken;
      Get.to(BottomNavBarscreen());
    }
  }

  @override
  void onInit() {
    isLogin();
    super.onInit();
  }
}
