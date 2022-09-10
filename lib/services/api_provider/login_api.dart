import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

class SignInProvider {
  Dio client;

  SignInProvider({required this.client});

  signinApi(var email, var password) async {
    try {
      GetStorage prefs = GetStorage();
      print(email);
      print(password);
      var data = {"email": email, "password": password};
      CommanLoader.loader();
      Response r = await client.post('api/signin', data: data);
      CommanLoader.hideLoader();
      if (r.statusMessage == 'OK') {
        prefs.write('token', r.data['token']);
        token = prefs.read('token');
        print(token);
        CommanLoader.hideLoader();
        g.Get.offAll(() => BottomNavBarscreen());
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

  googleSignIn() {
    
  }
}
