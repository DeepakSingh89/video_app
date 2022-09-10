// ignore_for_file: prefer_const_constructors

import 'package:raghu_education/controller/signup_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/login/login_screen.dart';
import 'package:raghu_education/constants/constant.dart';
import 'package:raghu_education/widgets/testFields_helper.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  SignupController _signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Form(
          key: _signupController.signUpkey,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 3.w, right: 3.w),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "create New Account",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15.sp),
                      ),
                      SizedBox(
                        height: 1.6.h,
                      ),
                      Textfields(
                          controller: _signupController.name,
                          validator: _signupController.namevalidation,
                          label: "Name"),
                      SizedBox(
                        height: 1.6.h,
                      ),
                      Textfields(
                        controller: _signupController.email,
                        validator: _signupController.emailvalidation,
                        label: "Email",
                        obscure: false,
                      ),
                      SizedBox(
                        height: 1.6.h,
                      ),
                      Textfields(
                        controller: _signupController.password,
                        validator: _signupController.passworValidation,
                        label: "Password",
                        obscure: true,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          _signupController.checklogin();
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
                                "Create",
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
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: "Already have an account ?",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.sp)),
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 12.sp)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      /* SizedBox(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Image.asset(
                            "assets/images/google.png",
                            height: 10.h,
                          ),
                          Spacer(),
                          Image.asset(
                            "assets/images/meta.png",
                            height: 10.h,
                          ),
                          Spacer()
                        ],
                      )
                     */
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
