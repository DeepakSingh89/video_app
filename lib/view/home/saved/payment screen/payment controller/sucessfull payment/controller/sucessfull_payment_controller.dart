import 'dart:async';
import 'dart:math';

import 'package:get/get.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';

class SuccessfullPaymentController extends GetxController {
  late Timer timer;
  @override
  void onInit() {
    timer = Timer(Duration(seconds: 2), () {
      Get.offAll(() => BottomNavBarscreen());
    });
    super.onInit();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
