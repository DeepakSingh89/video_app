// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:raghu_education/controller/bottom_bar_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/services/api_client.dart';
import 'package:raghu_education/view/cart/cart_screen.dart';
import 'package:raghu_education/view/home/courses/courses_screen.dart';
import 'package:raghu_education/view/home/home_page/home_module/popular_course_model.dart';
import 'package:raghu_education/view/home/home_page/notification/notification.dart';
import 'package:raghu_education/view/home/menu/menu_screen.dart';
import 'package:raghu_education/view/home/profile/myProfile_screen.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_controllers/all_home_controllers.dart';
import '../my_course/my course details/mycourse_details_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController _homeController = Get.put(HomeController());
  List<String> searches = [
    'It & Softwares',
    'Business',
    'Finance',
    'Project Managment',
    'Marketing',
    'Health',
    'Development',
    'Productivity',
    'Accounting',
    'Teaching',
    'music'
  ];

  List<String> image = [
    'assets/images/handShake.png',
    'assets/images/Group 1242.png',
    'assets/images/dataScience.png',
    'assets/images/math.png',
    'assets/images/ui.png'
  ];

  /* List<PopularCourses> popular = [
    PopularCourses(
        title: "UI/UX Design Course",
        img:
            "http://www.digitalberry.in/wp-content/uploads/2020/12/WhatsApp-Image-2020-12-21-at-5.07.41-PM-819x1024.jpeg",
        bestseller: true,
        duration: "18 h 40m",
        instructor: "Ravi",
        rating: 4),
    PopularCourses(
        title: "UI/UX Design Course",
        img:
            "http://www.digitalberry.in/wp-content/uploads/2020/12/WhatsApp-Image-2020-12-21-at-5.07.41-PM-819x1024.jpeg",
        bestseller: true,
        duration: "18 h 40m",
        instructor: "Ravi",
        rating: 4),
    PopularCourses(
        title: "UI/UX Design Course",
        img:
            "http://www.digitalberry.in/wp-content/uploads/2020/12/WhatsApp-Image-2020-12-21-at-5.07.41-PM-819x1024.jpeg",
        bestseller: true,
        duration: "18 h 40m",
        instructor: "Ravi",
        rating: 4),
    PopularCourses(
        title: "UI/UX Design Course",
        img:
            "http://www.digitalberry.in/wp-content/uploads/2020/12/WhatsApp-Image-2020-12-21-at-5.07.41-PM-819x1024.jpeg",
        bestseller: true,
        duration: "18 h 40m",
        instructor: "Ravi",
        rating: 4),
  ]; */

  BottomController _bottomController = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => _homeController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Stack(
              children: [
                SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          SizedBox(
                            height: 23.h,
                            //width: 100.w,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                //physics: BouncingScrollPhysics(),
                                itemCount:
                                    _homeController.getbannerModel.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Container(
                                    height: 23.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(

                                        //AssetImage("assets/images/Best Courses.png")

                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10))),
                                    child: Image.network(
                                      Client().baseUrl +
                                          _homeController.getbannerModel[index]
                                              .banner!, // this image doesn't exist
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          height: 23.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            //   image: DecorationImage(
                                            //  //     image: AssetImage('lib/assets/asset/User_image.png',c),
                                            // image: NetworkImage(ApiProvider.baseUrl + _drawerboxcontroller.getDrawerModel.data .user .profileImage.toString()),fit: BoxFit.cover
                                            //   ),
                                          ),
                                          child: Image.asset(
                                            'assets/images/Best Courses.png',
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Row(
                              children: [
                                Text(
                                  "Ongoing Course",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                ),
                                Spacer(),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.6.h,
                          ),
                          if (_homeController.getMyCourseModel.isNotEmpty)
                            InkWell(
                              onTap: () {
                                Get.to(() => MyCourseDetails(), arguments: {
                                  "id":
                                      _homeController.getMyCourseModel.first.id,
                                  "isMyCourse": true
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: PhysicalModel(
                                  color: secondryColor,
                                  elevation: 4,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  child: SizedBox(
                                    height: 17.h,
                                    width: 100.w,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          height: 17.h,
                                          width: 30.w,
                                          child: Image.network(
                                            _homeController.getMyCourseModel
                                                .first.courseImg,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              height: 17.h,
                                              width: 30.w,
                                              color: Colors.grey.shade200,
                                              child: Icon(
                                                  Icons.image_not_supported),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            SizedBox(
                                              width: 58.w,
                                              child: Text(
                                                _homeController.getMyCourseModel
                                                    .first.name,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 13.sp),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Text(
                                              "-" +
                                                  _homeController
                                                      .getMyCourseModel
                                                      .first
                                                      .instructor,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 12.sp,
                                                  color: Color(0xFF585858)),
                                            ),
                                            SizedBox(
                                              height: 0.4.h,
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 50.w,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0xFF707070),
                                                  size: 2.h,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 0.4.h,
                                            ),
                                            /* Row(
                                            children: [
                                              SizedBox(
                                                width: 25.w,
                                              ),
                                              Text(
                                                "50% Completed",
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Color(0xFF585858)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 1.3.h,
                                          ),
                                          Container(
                                            width: 50.w,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                              color: Color(0xFF53E648),
                                              width: 0.2.w,
                                            )),
                                            child: LinearProgressIndicator(
                                              backgroundColor: secondryColor,
                                              color: Color(0xFF53E648),
                                              value: 0.5,
                                            ),
                                          ) */
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(
                            height: 3.h,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => CourseScreen());
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Row(
                                children: [
                                  Text(
                                    "Featured",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp),
                                  ),
                                  Spacer(),
                                  Text(
                                    "View All",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 20.h,
                            width: 100.w,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount:
                                    _homeController.getfeatureModel.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  return Row(
                                    children: [
                                      // SizedBox(
                                      //   width: 1.w,
                                      // ),
                                      index == 5
                                          ? InkWell(
                                              onTap: () {
                                                //Get.to(() => CourseScreen());
                                                Get.to(() => MyCourseDetails(),
                                                    arguments: {
                                                      "id": _homeController
                                                          .getcourseModel[index]
                                                          .id,
                                                      "isMyCourse": false
                                                    });
                                              },
                                              child: Container(
                                                height: 20.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                  color: secondryColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10),
                                                  ),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text("More"),
                                                    Icon(Icons
                                                        .add_circle_outline_sharp)
                                                  ],
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: 20.h,
                                              width: 40.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10),
                                                ),
                                              ),
                                              child: Image.network(
                                                Client().baseUrl +
                                                    _homeController
                                                        .getfeatureModel[index]
                                                        .courseImg!, // this image doesn't exist
                                                fit: BoxFit.cover,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    height: 20.h,
                                                    width: 40.w,
                                                    decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      //   image: DecorationImage(
                                                      //  //     image: AssetImage('lib/assets/asset/User_image.png',c),
                                                      // image: NetworkImage(ApiProvider.baseUrl + _drawerboxcontroller.getDrawerModel.data .user .profileImage.toString()),fit: BoxFit.cover
                                                      //   ),
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/Best Courses.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                    ],
                                  );
                                }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Row(
                              children: [
                                Text(
                                  "Top Categories",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                                Spacer(),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.4,
                          ),

                          /* GridView.builder(
                        shrinkWrap: true,
                        itemCount: _homeController.getcourseModel.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 2.h,
                          mainAxisExtent: 33.h,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20),),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.blueGrey,
                                  )
                                ]
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal:3.w,
                                  vertical: 1.h

                              ),
                              child: Text(item,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp
                                ),
                              ),
                            ),
                          );
                        }),*/
                          Wrap(
                            alignment: WrapAlignment.start,
                            spacing: 2.w,
                            runSpacing: 3.w,
                            children: [
                              for (var item in _homeController.getcatagaryModel)
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 1,
                                          color: Colors.blueGrey,
                                        )
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 1.h),
                                    child: Text(
                                      item.category!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Row(
                              children: [
                                Text(
                                  "Popular courses",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                ),
                                Spacer(),
                                Text(
                                  "View All",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              itemCount: _homeController.getcourseModel.length,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 2.h,
                                mainAxisExtent: 33.h,
                                crossAxisCount: 2,
                              ),
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(() => MyCourseDetails(), arguments: {
                                      "id": _homeController
                                          .getcourseModel[index].id,
                                      "isMyCourse": false
                                    });
                                  },
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                        child: Image.network(
                                          _homeController
                                              .getcourseModel[index].courseImg,
                                          height: 20.h,
                                          width: 40.w,
                                          errorBuilder: (context, _, __) =>
                                              Container(
                                                  height: 20.h,
                                                  width: 40.w,
                                                  color: Colors.grey.shade200,
                                                  child: Icon(
                                                    Icons
                                                        .image_not_supported_rounded,
                                                    size: 40.sp,
                                                  )),
                                        ),
                                      ),

                                      /* Container(
                                        height: 20.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    _homeController
                                                        .getcourseModel[index]
                                                        .courseImg ))),
                                      ),
                                       */
                                      SizedBox(
                                        height: 0.9.h,
                                      ),
                                      Text(
                                        _homeController
                                            .getcourseModel[index].name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Center(
                                        child: Text(
                                          _homeController
                                              .getcourseModel[index].instructor,
                                          //popular[index].instructor,
                                          style: TextStyle(fontSize: 14.sp),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 0.9.h,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 6.w,
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.9.h,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          SizedBox(
                            height: 3.h,
                          ),
                          SizedBox(
                            height: 10.h,
                          )
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          _bottomController.changeTabIndex(1);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 26.h, left: 4.w),
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              height: 5.6.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.blueGrey,
                                    )
                                  ]),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    size: 3.h,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Text("Browse course, mentor, topic etc"),
                                  Spacer(),
                                  Icon(
                                    Icons.sort,
                                    size: 3.h,
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                App_Bar(
                    icon: InkWell(
                      onTap: () {
                        Get.to(() => MenuScreen());
                      },
                      child: Icon(
                        Icons.sort,
                        color: secondryColor,
                        size: 3.h,
                      ),
                    ),
                    title: 'Home',
                    image1: InkWell(
                      onTap: () {
                        Get.to(() => NotificationScreen());
                      },
                      child: Image.asset(
                        "assets/images/bell.png",
                        height: 4.h,
                      ),
                    ),
                    image2: InkWell(
                        onTap: () {
                          Get.to(() => CartScreen());
                        },
                        child: Image.asset(
                          "assets/images/cart.png",
                          height: 4.h,
                        ))),
              ],
            )),
    ));
  }
}
