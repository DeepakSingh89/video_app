import 'package:get/get.dart';
import 'package:raghu_education/controller/reset_password_controller.dart';
//import 'package:raghu_education/api%20provider/api_client.dart';
//import 'package:raghu_education/api%20provider/providers/registor_endpoint_provider.dart';
import 'package:raghu_education/import_files.dart';
import 'package:flutter/material.dart';
//import 'package:raghu_education/view/signUp/verify/verify.dart';

import '../services/api_client.dart';
import '../services/api_provider/forgot_password_endpoint_provider.dart';
import '../services/api_provider/register_endpoint_provider.dart';
import '../view/reset_password/reset_password_screen.dart';

class ForgotController extends GetxController {
  GlobalKey<FormState> forgotPasswordkey = GlobalKey();
  TextEditingController email = TextEditingController();


  @override
  void onInit() {

    email;
    super.onInit();
  }
  @override
  void dispose() {

    email.dispose();

    super.dispose();
  }

  String ? emailvalidation(value){
    if(value == ''){
      return 'enter your email';
    }
    return null;
  }

  checkforgotpasword() {
    final isvalidate = forgotPasswordkey.currentState!.validate();
    if (!isvalidate) {
      return;
    }
    else {
      //Get.to(()=>ResetPasswordScreen());
      forgotApi();
    }
    forgotPasswordkey.currentState!.save();
  }

  forgotApi(){
    Client _client = Client();
    ForgotProvider _forgotProvider = ForgotProvider(client: _client.init());
    _forgotProvider.forgotApi(email.text,);
  }


}