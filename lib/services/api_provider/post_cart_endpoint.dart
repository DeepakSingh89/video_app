import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

import '../../view/cart/cart_screen.dart';

class PostcartProvider {
  Dio client;

  PostcartProvider({required this.client});

  postCartApi(var course) async {
    try {
      GetStorage prefs = GetStorage();
      print(course);

      var data = {
        "course": [course],
      };
      CommanLoader.loader();
      Response r = await client.post('api/add/cart', data: data);
      CommanLoader.hideLoader();
      if (r.statusMessage == 'OK') {
        token = prefs.read('token');
        print(token);
        CommanLoader.hideLoader();
        g.Get.to(() => CartScreen());
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
