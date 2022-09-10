import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/cart/post_cart_controller.dart';
import 'package:raghu_education/view/home/home_page/notification/notification.dart';
import 'package:raghu_education/view/home/menu/menu_screen.dart';
import 'package:raghu_education/view/home/saved/save%20course%20details/saved_course_details.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

import '../../../services/api_client.dart';
import '../../cart/cart_screen.dart';
import '../home_controllers/all_home_controllers.dart';

class CourseScreen extends StatelessWidget {
  CourseScreen({Key? key}) : super(key: key);
  HomeController _homeController = Get.find();
  PostCartController _postCartController = Get.put(PostCartController());

  /* List<MyCourseModel> myCourse = [
    MyCourseModel(
        course: "Java Programming Beginner Course - I",
        img: "https://hackr.io/blog/best-python-courses/thumbnail/large",
        instructor: "Preet",
        rating: 4,
        time: "14 h"),
    MyCourseModel(
        course: "Java Programming Beginner Course - I",
        img: "https://hackr.io/blog/best-java-courses/thumbnail/large",
        instructor: "Preet",
        rating: 4,
        time: "14 h"),
    MyCourseModel(
        course: "Java Programming Beginner Course - I",
        img: "https://hackr.io/blog/best-python-courses/thumbnail/large",
        instructor: "Preet",
        rating: 4,
        time: "14 h"),
    MyCourseModel(
        course: "Java Programming Beginner Course - I",
        img: "https://hackr.io/blog/best-java-courses/thumbnail/large",
        instructor: "Preet",
        rating: 4,
        time: "14 h"),
    MyCourseModel(
        course: "Java Programming Beginner Course - I",
        img: "https://hackr.io/blog/best-python-courses/thumbnail/large",
        instructor: "Preet",
        rating: 4,
        time: "14 h")
  ];
 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Obx(
        () => _homeController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16.h,
                          ),
                          ListView.builder(
                              itemCount: _homeController.getcourseModel.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => SavedCoursedetails(
                                            course: _homeController
                                                .getcourseModel[index].name,
                                            instructor: _homeController
                                                .getcourseModel[index]
                                                .instructor,
                                            img: _homeController
                                                .getcourseModel[index]
                                                .courseImg,
                                            rating: _homeController
                                                .getcourseModel[index].rating??0,
                                            time: _homeController
                                                .getcourseModel[index].totelTimeOfCourse));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w),
                                        child: PhysicalModel(
                                          color: Colors.white,
                                          elevation: 5,
                                          child: Container(
                                            height: 14.h,
                                            width: 100.w,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 12.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(),
                                                  child: Image.network(
                                                    Client().baseUrl +
                                                        _homeController
                                                            .getcourseModel[
                                                                index]
                                                            .courseImg, // this image doesn't exist
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Container(
                                                        height: 12.h,
                                                        width: 30.w,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
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
                                                        _homeController
                                                            .getcourseModel[
                                                                index]
                                                            .name,
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
                                                          "- ${_homeController.getcourseModel[index].instructor}",
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
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "₹ " +
                                                              _homeController
                                                                  .getcourseModel[
                                                                      index]
                                                                  .price
                                                                  .toString(),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 9.sp,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),

                                                        // From here we can  send the Course Id.............................
                                                        InkWell(
                                                          onTap: () {
                                                            //here both of controller will call.............first post cart after then course id controller.
                                                            _postCartController
                                                                .postcartApi(
                                                                    _homeController
                                                                        .getcourseModel[
                                                                            index]
                                                                        .id);

                                                            // Get.to(() =>
                                                            //     CartScreen());

                                                           /*  Get.to(() =>
                                                                CartScreen()); */

                                                            // Get.to(()=> OrderHistoryScreen(
                                                            //   img : myCourse[index].img ,
                                                            //   name: myCourse[index].course

                                                            // ));
                                                          },
                                                          child: Container(
                                                            height: 4.h,
                                                            width: 25.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                            child: Center(
                                                                child: Text(
                                                                    'Add to cart')),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Container(
                                                          height: 4.h,
                                                          width: 15.w,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.yellow,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          3))),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                _homeController
                                                                    .getcourseModel[
                                                                        index]
                                                                    .rating.toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        9.sp),
                                                              ),
                                                              Icon(
                                                                Icons.star,
                                                                size: 1.5.h,
                                                              )
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    )
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
                              }),
                          SizedBox(
                            height: 10.h,
                          )
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
                        title: 'Courses',
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
                            onTap: () {},
                            child: Image.asset(
                              "assets/images/cart.png",
                              height: 4.h,
                            ))),
                  ],
                ),
              ),
      ),
    );
  }
}
