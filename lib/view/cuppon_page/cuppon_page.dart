import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/cuppon_page/cuppon_controller.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

import '../cuppon_apply/cuppon_apply_page.dart';

class CupponScreen extends StatelessWidget {
  CupponScreen({Key? key}) : super(key: key);
  GetCupponController _cupponController = Get.put(GetCupponController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _cupponController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 14.h,
                          ),
                          SizedBox(
                            height: 53.h,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount:
                                  _cupponController.getCupponModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Container(
                                          height: 7.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              // ignore: prefer_const_literals_to_create_immutables
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.blueGrey,
                                                    blurRadius: 1)
                                              ]),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Image.network(
                                                'https://media.istockphoto.com/vectors/coupon-frame-clip-to-save-frame-with-a-dotted-bounding-vector-id1208768030?k=20&m=1208768030&s=612x612&w=0&h=eqtenoZt9e1tD9ddeo1sDkbp1BUaK9CuMePkIS79cD8=',
                                                height: 40,
                                              ),

                                              // Image.asset(
                                              //   "assets/images/notification.png",
                                              //   height: 10.h,
                                              // ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  Text(
                                                    "Cupppon Code:${_cupponController.getCupponModel[index].couponCode}",

                                                    //'Cupppon Code',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.amberAccent),
                                                  ),
                                                  Text(
                                                    "Cupppon Discount:${_cupponController.getCupponModel[index].couponCode}",

                                                    //'Cupppon Discount',
                                                    style: TextStyle(
                                                        color:
                                                            Colors.amberAccent),
                                                  ),
                                                ],
                                              ),
                                              Spacer(),
                                            ],
                                          )),
                                    ),
                                    SizedBox(height: 2.h),
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                Get.to(() => ApplyCupponScreen());
                              },
                              child: Container(
                                height: 5.3.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text('NEXT')),
                              ),
                            ),
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
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: secondryColor,
                        ),
                      ),
                      title: "                 All Cuppon",
                      image1: SizedBox(),
                      image2: SizedBox())
                ],
              )),
      ),
    );
  }
}
