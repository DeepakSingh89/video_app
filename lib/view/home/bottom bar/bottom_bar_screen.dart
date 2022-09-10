// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unrelated_type_equality_checks

import 'package:raghu_education/controller/bottom_bar_controller.dart';
import 'package:raghu_education/controller/payment_gateway_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/home_page/home_screen.dart';
import 'package:raghu_education/view/home/my_course/my_course.dart';
import 'package:raghu_education/view/home/profile/myProfile_screen.dart';
import 'package:raghu_education/view/home/saved/saved_course.dart';
import 'package:raghu_education/view/home/search/search_screen.dart';
import 'package:raghu_education/constants/constant.dart';

class BottomNavBarscreen extends StatelessWidget {
  BottomNavBarscreen({Key? key}) : super(key: key);

  BottomController _bottomController =
      Get.put(BottomController(), permanent: true);
  final PaymentGatewayController paymentGatewayController =
      Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Stack(
            children: [
              Center(
                child: IndexedStack(
                  index: _bottomController.tabindex.value,
                  children: [
                    HomeScreen(),
                    SearchScreen(),
                    MyCourseScreen(),
                    MyProfilescreen()
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 9.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: secondryColor,
                      border: Border.all(width: 0.3.w, color: primaryColor),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          _bottomController.changeTabIndex(0);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/home (2).png",
                              height: 4.h,
                              color: _bottomController.tabindex == 0
                                  ? primaryColor
                                  : Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: _bottomController.tabindex == 0
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          _bottomController.changeTabIndex(1);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search,
                              size: 4.h,
                              color: _bottomController.tabindex == 1
                                  ? primaryColor
                                  : Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                color: _bottomController.tabindex == 1
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          _bottomController.changeTabIndex(2);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/myCourses.png",
                              height: 4.h,
                              color: _bottomController.tabindex == 2
                                  ? primaryColor
                                  : Colors.grey,
                            ),
                            Text(
                              'My Course',
                              style: TextStyle(
                                color: _bottomController.tabindex == 2
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          _bottomController.changeTabIndex(3);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              size: 4.h,
                              color: _bottomController.tabindex == 3
                                  ? primaryColor
                                  : Colors.grey,
                            ),
                            Text(
                              'Account',
                              style: TextStyle(
                                color: _bottomController.tabindex == 3
                                    ? primaryColor
                                    : Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
