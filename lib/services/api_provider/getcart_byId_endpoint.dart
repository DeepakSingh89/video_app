import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/home/models/get_banner_model.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

import '../../view/cart/get_cart_by_id/get_cart_model.dart';
import '../../view/home/home_page/home_module/get_all_course_model.dart';
import '../../view/home/home_page/home_module/get_feature_model.dart';

class GetCartProvider {
  late Dio client;

  GetCartProvider({required this.client});

  getcartApi() async {
    try {
      GetStorage prefs = GetStorage();
      Response r = await client.get('api/getsingleusercart');
      print(r.data);
      if (r.statusMessage == 'OK') {
        token = prefs.read('token');
        //prefs.write('token', r.data['token']);

        print(token);
        return getCartModelFromJson(jsonEncode(r.data['data']));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      print(e.response!.data);
      return Future.error(e.message);
    }
  }
}
