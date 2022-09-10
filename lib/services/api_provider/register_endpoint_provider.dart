import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/widgets/commonLoader.dart';

import '../../view/home/bottom bar/bottom_bar_screen.dart';

class RegisterEndPoint{
  Dio client;
  RegisterEndPoint({required this.client});

  RegisterApi(var name , var email, var password) async{
    try {
      CommanLoader.loader();
      var data = {
        "name": name,
        "email": email,
        "password": password
      };

      Response r = await client.post('api/signup', data: data);
      print(r.statusCode);
      print(r.data);
      CommanLoader.hideLoader();
      if (r.statusCode == 201) {
        g.Get.to(()=> BottomNavBarscreen());
      } else {
        print(r.data);
        CommanLoader.message(r.data['error']);
      }
    } on DioError catch (err) {
      CommanLoader.hideLoader();
      CommanLoader.message(err.message);
    }

  }
}