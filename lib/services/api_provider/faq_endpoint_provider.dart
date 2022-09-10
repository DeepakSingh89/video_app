import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/home/models/get_banner_model.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

import '../../view/home/home_page/home_module/get_all_course_model.dart';
import '../../view/home/home_page/home_module/get_feature_model.dart';
import '../../view/home/menu/faq/faq_model.dart';

class FaqProvider {
  late Dio client;

  FaqProvider({required this.client});

  getFaqApi() async {
    try {
      GetStorage prefs = GetStorage();

      Response r = await client.get('api/faq');
      if (r.statusMessage == 'OK') {
        token = prefs.read('token');
        print(token);
        //prefs.write('token', r.data['token']);

        print(token);
        return getFaqModelFromJson(jsonEncode(r.data['getFaq']));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
