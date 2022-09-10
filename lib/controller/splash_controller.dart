// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:get/get.dart';
import 'package:raghu_education/view/welocome/onboarding_screen.dart';

class SplashController extends GetxController {
@override
  void onInit() {
    Timer(Duration(seconds: 5),(){
      Get.offAll(()=> OnboardingScren());
    });
    super.onInit();
  }
}