// ignore_for_file: prefer_const_constructors

import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/home_controllers/all_home_controllers.dart';
import 'package:raghu_education/view/home/home_page/notification/notification.dart';
import 'package:raghu_education/view/home/menu/book_mark/get_bookmark_controller.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/mycourse_details_screen.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20model/my_course_model.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

import '../menu_screen.dart';

class MyBookmarkScreen extends StatelessWidget {
  MyBookmarkScreen({Key? key}) : super(key: key);
  GetBookmarkController _bookmarkController = Get.put(GetBookmarkController());

  //final HomeController _homeController = Get.find();

  /* List<MyCourseModel> myCourse = [
    MyCourseModel(
        course: "Java Programming Beginner Course - I",
        img: "https://hackr.io/blog/best-java-courses/thumbnail/large",
        instructor: "Preet",
        rating: 4,
        time: "14 h"),
    MyCourseModel(
        course: "Java Programming Beginner Course - I",
        img: "https://hackr.io/blog/best-java-courses/thumbnail/large",
        instructor: "Preet",
        rating: 4,
        time: "14 h")
  ];
 */
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => _bookmarkController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          ListView.builder(
                              itemCount:
                                  _bookmarkController.getBookmarkModel.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => MyCourseDetails(),
                                            arguments: {
                                              "id": _bookmarkController
                                                  .getBookmarkModel[index].id,
                                              "isMyCourse": false
                                            });
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        child: PhysicalModel(
                                          color: Colors.white,
                                          elevation: 5,
                                          child: Container(
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 12.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          fit: BoxFit.fill,
                                                          image: NetworkImage(
                                                              _bookmarkController
                                                                  .getBookmarkModel[
                                                                      index]
                                                                  .courseImg!))),
                                                ),
                                                SizedBox(width: 2.w),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 60.w,
                                                      child: Text(
                                                        _bookmarkController
                                                            .getBookmarkModel[
                                                                index]
                                                            .name!,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          _bookmarkController
                                                              .getBookmarkModel[
                                                                  index]
                                                              .instructor!,
                                                          //"- ${myCourse[index].instructor}",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 13.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
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
                                                              color: Color(
                                                                  0xFF585858)),
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
                                                        color: Colors.red,
                                                        width: 0.2.w,
                                                      )),
                                                      child:
                                                          LinearProgressIndicator(
                                                        backgroundColor:
                                                            secondryColor,
                                                        color: Colors.red,
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
                                      height: 4.h,
                                    )
                                  ],
                                );
                              })
                        ],
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
                          title: 'My Bookmark',
                          image1: InkWell(
                            onTap: () {
                              Get.to(() => NotificationScreen());
                            },
                            child: Image.asset(
                              "assets/images/bell.png",
                              height: 4.h,
                            ),
                          ),
                          image2: Container(
                            height: 5.h,
                            width: 5.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/j6teixhgksmh0v0y9f5i/the-game-accuser-awarded-control-over-his-record-label?fimg-ssr"),
                                )),
                          )),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
