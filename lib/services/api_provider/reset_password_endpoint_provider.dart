import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

import '../../view/login/login_screen.dart';
import '../../view/reset_password/reset_password_screen.dart';

class ResetProvider {
  Dio client;

  ResetProvider({required this.client});

  resetApi(var code, var password) async {
    try {
      GetStorage prefs = GetStorage();
      print(code);
      print(password);
      var data = {"code": code, "password": password};
      CommanLoader.loader();
      Response r = await client.post('change/password/user', data: data);
      CommanLoader.hideLoader();
      if (r.statusMessage == 'OK') {
        // prefs.write('token', r.data['token']);
        // token = prefs.read('token');
        // print(token);
        CommanLoader.hideLoader();

        //Get.to(()=>ResetPasswordScreen());
        g.Get.offAll(() => LoginScreen());
      } else {
        CommanLoader.hideLoader();
        CommanLoader.message("wrong credentials");
      }
    } on DioError catch (e) {
      print(e.response!.data);
      CommanLoader.hideLoader();
      CommanLoader.message(e.message);
    }
  }
}
