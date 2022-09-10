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
import '../../view/home/menu/subscription/subscription controller/pakage_subscription_model.dart';

class PackageProvider {
  late Dio client;

  PackageProvider({required this.client});

  getcourseApi() async {
    try {
      Response r = await client.get('api/get/package');
      if (r.statusMessage == 'OK') {
        //prefs.write('token', r.data['token']);

        print(token);
        return getPackageModelFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
