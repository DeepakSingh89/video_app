// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/about%20course/about_course.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/controller/mycouse_details_controller.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/course%20lecture/course_lecture.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/course%20ratings/course_ratings.dart';
import 'package:raghu_education/widgets/app_bar.dart';

import '../../../cart/cart_screen.dart';
import '../../../cart/post_cart_controller.dart';

class MyCourseDetails extends GetView<MyCoursesDetailsController> {
  MyCoursesDetailsController myCoursesDetailsController =
      Get.put(MyCoursesDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => DefaultTabController(
          length: 3,
          child: SafeArea(
              child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 8.h,
                  ),
                  Image.network(
                    state!.courseImg,
                    height: 30.h,
                    errorBuilder: (context, error, stackTrace) => SizedBox(
                        height: 30.h,
                        child: Center(child: Icon(Icons.image_not_supported))),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: TabBarView(children: [
                      AboutCourse(
                        courseModel: state,
                      ),
                      CourseLecture(
                        lectures: state.lecture,
                        isMyCourse: controller.isMyCourse,
                        courseId: state.id,
                      ),
                      CourseRating(courseId: state.id,)
                    ]),
                  )
                ],
              ),
              Positioned(
                  top: 27.h,
                  left: 5.w,
                  right: 5.w,
                  child: PhysicalModel(
                    color: Colors.blueGrey,
                    elevation: 10,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 1.h,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "- by " + state.instructor,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Colors.grey,
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    if (!controller.isMyCourse)
                                      Text(
                                        "₹ " + state.price.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 9.sp,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    // From here we can  send the Course Id.............................
                                    if (!controller.isMyCourse)
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 1.h),
                                        child: InkWell(
                                          onTap: () {
                                            //here both of controller will call.............first post cart after then course id controller.
                                            PostCartController
                                                _postCartController =
                                                Get.put(PostCartController());
                                            _postCartController
                                                .postcartApi(state.id);
                                            //Get.to(() => CartScreen());
                                          },
                                          child: Container(
                                            height: 4.h,
                                            width: 25.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blue,
                                            ),
                                            child: Center(
                                                child: Text('Add to cart')),
                                          ),
                                        ),
                                      ),
                                    if (!controller.isMyCourse)  
                                    Container(
                                      height: 3.h,
                                      width: 13.w,
                                      color: Color(0xFFE5C231),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              state.rating==null?"":state.rating.toString(),
                                              style: TextStyle(
                                                  color: Color(0xFF614E01),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.sp),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 2.3.h,
                                              color: Color(0xFF614E01),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            TabBar(
                                labelColor: Colors.blue,
                                unselectedLabelColor: Colors.grey,
                                tabs: [
                                  Tab(
                                    child: Text(
                                      "About",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Videos",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Tab(
                                    child: Text(
                                      "Ratings",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ])
                          ],
                        ),
                      ),
                    ),
                  )),
              App_Bar(
                  icon: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 3.h,
                      color: Colors.white,
                    ),
                  ),
                  title: "My Course",
                  image1: Image.asset(
                    "assets/images/bell.png",
                    height: 4.h,
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
                          )))),
            ],
          )),
        ),
      ),
    );
  }
}
