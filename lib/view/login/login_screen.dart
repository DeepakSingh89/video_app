// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:raghu_education/controller/login_Controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/signUp/signup_screen.dart';

import 'package:raghu_education/constants/constant.dart';
import 'package:raghu_education/widgets/testFields_helper.dart';

import '../forgot_password/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: SafeArea(
          child: Form(
            key: _loginController.signinkey,
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
                            controller: _loginController.email,
                            validator: _loginController.emailvalidation,
                            label: "Email Id"),
                        SizedBox(
                          height: 1.6.h,
                        ),
                        Textfields(
                          controller: _loginController.password,
                          validator: _loginController.passwordvalidation,
                          label: "Password",
                          obscure: true,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            _loginController.checklogin();
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
                                  "Login",
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
                            Get.to(() => SignupScreen());
                          },
                          child: Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Dont have any account ? ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.sp)),
                                  TextSpan(
                                      text: "Create New Account",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 12.sp)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Center(
                            child: InkWell(
                          onTap: () {
                            Get.to(() => ForgotPasswordScreen());
                          },
                          child: Text(
                            "Forgot Password",
                            style:
                                TextStyle(color: primaryColor, fontSize: 12.sp),
                          ),
                        )),
                        SizedBox(
                          height: 3.h,
                        ),
                       /*  Center(
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
                        ) */
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
