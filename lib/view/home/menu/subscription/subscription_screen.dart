// ignore_for_file: prefer_const_constructors

import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/menu/subscription/subscription%20controller/subscription_controller.dart';
import 'package:raghu_education/constants/constant.dart';

import '../../../cuppon_page/cuppon_page.dart';

class SubscriptionScreen extends StatelessWidget {
  SubscriptionScreen({Key? key}) : super(key: key);

  SubscriptionController _subscriptionController =
      Get.put(SubscriptionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Obx(
        () => _subscriptionController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                children: [
                  Obx(() => SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 28.h,
                            ),
                            RadioListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  "Monthly Plan",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: PaymentMethod.monthly,
                                groupValue:
                                    _subscriptionController.method.value,
                                activeColor: Colors.grey[700],
                                onChanged: _subscriptionController.onchaged),

                            // SizedBox(
                            //   height: 1.h,
                            // ),

                            SizedBox(
                              height: 23.h,
                              //width: 100.w,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  //physics: BouncingScrollPhysics(),
                                  itemCount: _subscriptionController
                                      .getpackageModel.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          color: secondryColor,
                                          border: Border.all(
                                              width: 0.1.w, color: texxtcolor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              _subscriptionController
                                                  .getpackageModel[index]
                                                  .package!,
                                              // "Package",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(children: [
                                            Icon(Icons.circle,
                                                size: 2.4.h,
                                                color: Colors.grey[600]),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              _subscriptionController
                                                  .getpackageModel[index]
                                                  .descrption!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[600]),
                                            )
                                          ]),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(children: [
                                            Icon(Icons.circle,
                                                size: 2.4.h,
                                                color: Colors.grey[600]),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              _subscriptionController
                                                  .getpackageModel[index]
                                                  .descrption!,

                                              // "It was Popularise in the 1960s",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[600]),
                                            )
                                          ]),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(children: [
                                            Icon(Icons.circle,
                                                size: 2.4.h,
                                                color: Colors.grey[600]),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              _subscriptionController
                                                  .getpackageModel[index]
                                                  .descrption!,
                                              //"It was Popularise in the 1960s",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[600]),
                                            )
                                          ]),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(() => CupponScreen());
                                              },
                                              child: Container(
                                                height: 4.6.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF707070),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Center(
                                                  child: Text(
                                                    "Price:${_subscriptionController.getpackageModel[index].price.toString()}",
                                                    style: TextStyle(
                                                        color: secondryColor,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),

                            RadioListTile(
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                title: Text(
                                  "Yearly Plan",
                                  style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: PaymentMethod.yearly,
                                groupValue:
                                    _subscriptionController.method.value,
                                activeColor: Colors.grey[700],
                                onChanged: _subscriptionController.onchaged),

                            SizedBox(
                              height: 23.h,
                              //width: 100.w,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  //physics: BouncingScrollPhysics(),
                                  itemCount: _subscriptionController
                                      .getpackageModel.length,
                                  itemBuilder: (BuildContext ctx, index) {
                                    return Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          color: secondryColor,
                                          border: Border.all(
                                              width: 0.1.w, color: texxtcolor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8))),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              _subscriptionController
                                                  .getpackageModel[index]
                                                  .package!,
                                              // "Package",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.sp),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(children: [
                                            Icon(Icons.circle,
                                                size: 2.4.h,
                                                color: Colors.grey[600]),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              _subscriptionController
                                                  .getpackageModel[index]
                                                  .descrption!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[600]),
                                            )
                                          ]),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(children: [
                                            Icon(Icons.circle,
                                                size: 2.4.h,
                                                color: Colors.grey[600]),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              _subscriptionController
                                                  .getpackageModel[index]
                                                  .descrption!,
                                              // "It was Popularise in the 1960s",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[600]),
                                            )
                                          ]),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Row(children: [
                                            Icon(Icons.circle,
                                                size: 2.4.h,
                                                color: Colors.grey[600]),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Text(
                                              _subscriptionController
                                                  .getpackageModel[index]
                                                  .descrption!,
                                              // "It was Popularise in the 1960s",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[600]),
                                            )
                                          ]),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(() => CupponScreen());
                                              },
                                              child: Container(
                                                height: 4.6.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF707070),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8))),
                                                child: Center(
                                                  child: Text(
                                                    "Price:${_subscriptionController.getpackageModel[index].price.toString()}",
                                                    style: TextStyle(
                                                        color: secondryColor,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          )
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Container(
                              height: 7.h,
                              width: 100.w,
                              decoration: BoxDecoration(color: primaryColor),
                              child: Center(
                                child: Text(
                                  "Renew Subscription",
                                  style: TextStyle(
                                      color: secondryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  Container(
                    height: 26.h,
                    width: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                      ),
                      color: Color(0xFFFF3842),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: secondryColor,
                            ),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Session Expired",
                                style: TextStyle(
                                    color: secondryColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Text(
                                "It was popularised in the 1960s with the \nrelease of Letraset sheets containing Lorem \nIpsum passages, and more recently with \ndesktop publishing software like Aldus\n PageMaker including versions of Lorem Ipsum.",
                                style: TextStyle(
                                    color: secondryColor,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )),
      ),
    );
  }
}
