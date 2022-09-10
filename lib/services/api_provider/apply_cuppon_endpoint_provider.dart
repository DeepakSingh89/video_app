import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

import '../../view/cart/cart_screen.dart';

class CodeProvider {
  Dio client;

  CodeProvider({required this.client});

  cupponCodeApi(var couponCode) async {
    try {
      GetStorage prefs = GetStorage();
      print(couponCode);

      var data = {
        "couponCode": couponCode,
      };
      CommanLoader.loader();
      Response r = await client.post('api/coupon/applye', data: data);
      CommanLoader.hideLoader();
      if (r.statusMessage == 'OK') {
        token = prefs.read('token');
        print(token);
        CommanLoader.hideLoader();
        //g.Get.offAll(() => CartScreen());
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
