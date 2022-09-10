import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/controller/bottom_bar_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/home/menu/about%20us/about_us_screen.dart';
import 'package:raghu_education/view/home/menu/faq/faq_screen.dart';

import 'package:raghu_education/view/home/menu/help%20n%20support/help_n_support.dart';
import 'package:raghu_education/view/home/menu/mcq/mcq_screen.dart';
import 'package:raghu_education/view/home/menu/subscription/subscription_screen.dart';
import 'package:raghu_education/view/home/menu/tnc/tnc_screen.dart';
import 'package:raghu_education/view/home/saved/saved_course.dart';
import 'package:raghu_education/view/login/login_screen.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

import 'book_mark/book_mark_screen.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  BottomController _bottomController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 3.w,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 13.h,
                  ),
                  InkWell(
                    onTap: () {
                      _bottomController.tabindex(0);
                      Get.to(() => BottomNavBarscreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/home.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      _bottomController.tabindex(2);
                      Get.to(() => BottomNavBarscreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/cap.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "My Courses",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => MyBookmarkScreen());
                      // SavedScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/verfied.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "Bookmark Courses",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => FaqScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/faq.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "FAQs",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => HelpnSupportScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/hrl.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "Help & Support",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => TncScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/tnc.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "Tearms and Conditions",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/privacy.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "Privacy Policy",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => McqScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/mcq.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "MCQ",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => AboutUsScrenn());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/aboutus.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "About Us",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => SubscriptionScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/subscription.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "Subscription",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  InkWell(
                    onTap: () {
                      GetStorage box = GetStorage();
                      box.erase();
                      Get.offAll(() => LoginScreen());
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/logout.png",
                          height: 3.3.h,
                        ),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
          App_Bar(
              icon: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.sort,
                  color: secondryColor,
                  size: 3.h,
                ),
              ),
              title: "Menu",
              image1: Spacer(),
              image2: Image.asset(
                "assets/images/bell.png",
                height: 3.h,
              ))
        ],
      )),
    );
  }
}
