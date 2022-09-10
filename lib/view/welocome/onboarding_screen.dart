// ignore_for_file: prefer_const_constructors, unrelated_type_equality_checks

import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:raghu_education/controller/onboard_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/login/login_screen.dart';
import 'package:raghu_education/constants/constant.dart';

class OnboardingScren extends StatelessWidget {
  OnboardingScren({Key? key}) : super(key: key);

  List<String> pictures = [
    "assets/images/graph&charts.svg",
    "assets/images/books.svg",
    "assets/images/dashboard.svg"
  ];
  List<String> title = [
    "Progress reports in your handd",
    "Best study material  to Ace exams",
    "Learnning at your pace"
  ];

  OnboardController onboardController = Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: PageView.builder(
              controller: onboardController.controller,
              onPageChanged: onboardController.onPageChanges,
              itemCount: pictures.length,
              itemBuilder: (BuildContext ctx, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      pictures[index],
                      height: 30.h,
                      width: 40.w,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      title[index],
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                );
              },
            ),
          ),
          Obx(
            () => Padding(
              padding: EdgeInsets.only(top: 75.h, left: 40.w, right: 10.w),
              child: Row(
                children: [
                  Container(
                    height: 4.h,
                    width: 4.w,
                    decoration: BoxDecoration(
                      color: onboardController.currentPage == 0
                          ? Color(0xFF4093FF)
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1.w),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    height: 4.h,
                    width: 4.w,
                    decoration: BoxDecoration(
                      color: onboardController.currentPage == 1
                          ? Color(0xFF4093FF)
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1.w),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    height: 4.h,
                    width: 4.w,
                    decoration: BoxDecoration(
                      color: onboardController.currentPage == 2
                          ? Color(0xFF4093FF)
                          : Colors.white,
                      border: Border.all(color: Colors.black, width: 0.1.w),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(() => LoginScreen());
            },
            child: Padding(
              padding: EdgeInsets.only(top: 2.h, left: 85.w),
              child: Text(
                "Skip",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
