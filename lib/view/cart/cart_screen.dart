import 'package:raghu_education/controller/payment_gateway_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/profile/myProfile_screen.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';
import 'get_cart_by_id/get_cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final GetCartController _getCartController = Get.put(GetCartController());
  final PaymentGatewayController paymentGatewayController = Get.find();
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
    return Scaffold(
        body: Obx(
      () => _getCartController.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12.h,
                        ),
                        // Text(
                        //   'Courses Purchased(2)',
                        //   style: TextStyle(
                        //     color: texxtcolor,
                        //     fontWeight: FontWeight.w400,
                        //     fontSize: 15.sp,
                        //   ),
                        // ),
                        SizedBox(
                          height: 3.h,
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            itemCount:
                                _getCartController.getcatmodel.course!.length,
                            //itemCount: myCourse.length,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, crossAxisSpacing: 5.w),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Get.to(()=> OrderHistoryScreen(
                                  //   img : myCourse[index].img!,
                                  //   name: myCourse[index].course!

                                  // ));
                                },
                                child: Container(
                                  height: 18.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFEFEFEF),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 14.h,
                                        width: 40.w,
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey,
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                    _getCartController
                                                        .getcatmodel
                                                        .course![index]
                                                        .courseImg)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(1))),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        """${_getCartController.getcatmodel.course![index].name}""",
                                        style: TextStyle(
                                            color: texxtcolor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.sp),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                        SizedBox(
                          height: 2.h,
                        ),

                        Container(
                          width: 95.w,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total Ammount'),
                                    Text(_getCartController
                                        .getcatmodel.course![0].price
                                        .toString()),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  paymentGatewayController.openCheckout();
                                },
                                child: Container(
                                  color: Colors.blue,
                                  height: 5.h,
                                  width: 40.w,
                                  child: const Center(
                                      child: Text(
                                    'Check Out',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                App_Bar(
                    icon: InkWell(
                      onTap: () {
                        //Get.to(() => CourseScreen());
                        // navigator.pop(context());
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: secondryColor,
                        size: 3.h,
                      ),
                    ),
                    title: 'Cart',
                    image1: InkWell(
                      onTap: () {
                        //Get.to(()=> NotificationScreen());
                      },
                      child: Image.asset(
                        "assets/images/bell.png",
                        height: 4.h,
                      ),
                    ),
                    image2: InkWell(
                      onTap: () {
                        Get.to(() => MyProfilescreen());
                      },
                      child: Container(
                        height: 5.h,
                        width: 5.h,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/j6teixhgksmh0v0y9f5i/the-game-accuser-awarded-control-over-his-record-label?fimg-ssr"),
                            )),
                      ),
                    )),
              ],
            )),
    ));
  }
}
