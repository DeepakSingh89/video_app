import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/cuppon_apply/apply_cuppon_controller.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

import '../../widgets/testFields_helper.dart';
import '../cart/cart_screen.dart';

class ApplyCupponScreen extends StatelessWidget {
  ApplyCupponScreen({Key? key}) : super(key: key);
  // ignore: prefer_final_fields
  CouponCodeController _couponCodeController = Get.put(CouponCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: _couponCodeController.couponCodekey,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.h, left: 3.w, right: 3.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello User",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 1.6.h,
                    ),
                    Textfields(
                        controller: _couponCodeController.couponCode,
                        validator: _couponCodeController.couponCodevalidation,
                        label: "Cuppon Code"),
                    SizedBox(
                      height: 1.6.h,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    InkWell(
                      onTap: () {
                        _couponCodeController.checkcouponCode();
                      },
                      child: Center(
                        child: Container(
                          height: 6.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: primaryColor),
                          child: Center(
                            child: Text(
                              "Apply Cuppon",
                              style: TextStyle(
                                  color: secondryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => CartScreen());
                        //_loginController.checklogin();
                      },
                      child: Center(
                        child: Container(
                          height: 6.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: primaryColor),
                          child: Center(
                            child: Text(
                              "SKIP",
                              style: TextStyle(
                                  color: secondryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp),
                            ),
                          ),
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
                title: "                 Apply Cuppon",
                image1: SizedBox(),
                image2: SizedBox())
          ],
        ),
      )),
    );
  }
}
