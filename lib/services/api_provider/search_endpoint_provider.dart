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
import '../../view/home/search/search_model.dart';

class SearchProvider {
  late Dio client;

  SearchProvider({required this.client});

  getSearchApi(String searchKey) async {
    try {
      GetStorage prefs = GetStorage();

      Response r = await client.get('api/search?name=$searchKey');
      if (r.statusMessage == 'OK') {
        token = prefs.read('token');
        print(token);
        //prefs.write('token', r.data['token']);

        print(token);
        return getSearchModelFromJson(jsonEncode(r.data['Course']));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      print(e.response!.data);
      return Future.error(e.message);
    }
  }
}
