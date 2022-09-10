import 'package:get/get.dart';
//import 'package:raghu_education/api%20provider/api_client.dart';
//import 'package:raghu_education/api%20provider/providers/registor_endpoint_provider.dart';
import 'package:raghu_education/import_files.dart';
import 'package:flutter/material.dart';
//import 'package:raghu_education/view/signUp/verify/verify.dart';

import '../services/api_client.dart';
import '../services/api_provider/register_endpoint_provider.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> signUpkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    name;
    email;
    password;
    super.onInit();
  }
  @override
  void dispose() {

    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
  String ? namevalidation(value){
    if(value == ''){
      return 'enter your name';
    }
    return null;
  }
  String ? emailvalidation(value){
    if(value == ''){
      return 'enter your email';
    }
    return null;
  }
  String ? passworValidation(value){
    if(value == ''|| value != password.text){
      return 'enter your password';
    }

    return null;
  }
  checklogin() {
    final isvalidate = signUpkey.currentState!.validate();
    if (!isvalidate) {
      return;
    }
    else {
      callLoginApi();
    }
    signUpkey.currentState!.save();
  }

  callLoginApi(){
    Client _client = Client();
    RegisterEndPoint _register = RegisterEndPoint(client: _client.init());
    _register.RegisterApi(name.text, email.text, password.text);
  }


}