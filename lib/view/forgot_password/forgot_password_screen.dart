// ignore_for_file: prefer_const_constructors

import 'package:raghu_education/controller/signup_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/login/login_screen.dart';
import 'package:raghu_education/constants/constant.dart';
import 'package:raghu_education/widgets/testFields_helper.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/forget_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({Key? key}) : super(key: key);
  ForgotController _forgotController = Get.put(ForgotController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Form(
          key: _forgotController.forgotPasswordkey,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 22.h, left: 3.w, right: 3.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 1.6.h,
                      ),
                      Textfields(
                        controller: _forgotController.email,
                        validator: _forgotController.emailvalidation,
                        label: "Email",
                        obscure: false,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          _forgotController.checkforgotpasword();
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
                                "Next",
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
                      SizedBox(
                        height: 1.h,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Center(
                        child: Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: "       OR",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12.sp)),
                            TextSpan(
                                text: "\n\n Sign up with",
                                style: TextStyle(
                                    color: primaryColor, fontSize: 12.sp)),
                          ]),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
