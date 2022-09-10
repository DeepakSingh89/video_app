// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:raghu_education/controller/login_Controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/signUp/signup_screen.dart';

import 'package:raghu_education/constants/constant.dart';
import 'package:raghu_education/widgets/testFields_helper.dart';

import '../../controller/reset_password_controller.dart';
import '../forgot_password/forgot_password_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  ResetPasswordcontroller _resetPasswordcontroller =
      Get.put(ResetPasswordcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Form(
          key: _resetPasswordcontroller.passwordresetformKey,
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
                        "Reset Your Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 1.6.h,
                      ),
                      Textfields(
                          controller: _resetPasswordcontroller.code,
                          validator: _resetPasswordcontroller.codeValiadation,
                          label: "Enter mail Code"),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      Textfields(
                        controller: _resetPasswordcontroller.password,
                        validator: _resetPasswordcontroller.confirmPassword,
                        label: "New Password",
                        obscure: true,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      InkWell(
                        onTap: () {
                          _resetPasswordcontroller.checkPassword();
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
                                "Reset Password",
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
            ],
          ),
        ),
      ),
    );
  }
}
