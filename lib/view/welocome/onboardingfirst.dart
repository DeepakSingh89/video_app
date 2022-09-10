import 'package:lottie/lottie.dart';
import 'package:raghu_education/controller/onboardFirst_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/welocome/onboarding_screen.dart';
import 'package:raghu_education/constants/constant.dart';

class OnboardFirstScreen extends StatelessWidget {
  OnboardFirstScreen({Key? key}) : super(key: key);

  FirstOnboardController _firstOnboardController =
      Get.put(FirstOnboardController());
  List<String> images = [
    'assets/images/student.json',
    'assets/images/teacher.json'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30.h),
            child: PageView.builder(
                controller: _firstOnboardController.controller,
                onPageChanged: _firstOnboardController.onPageChanged,
                itemCount: images.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Lottie.asset(images[index], height: 30.h),
                      SizedBox(
                        height: 4.h,
                      ),
                    ],
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 80.h,
              left: 3.w,
              right: 3.w,
            ),
            child: InkWell(
              onTap: () {
                _firstOnboardController.currentPage == 1
                    ? Get.to(() => OnboardingScren())
                    : _firstOnboardController.nextPage();
              },
              child: Container(
                height: 6.2.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: primaryColor),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: secondryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
