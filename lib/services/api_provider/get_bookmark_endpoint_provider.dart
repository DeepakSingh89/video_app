import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/home/models/get_banner_model.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

import '../../view/cuppon_page/cuppon_model.dart';
import '../../view/home/home_page/home_module/get_all_course_model.dart';
import '../../view/home/home_page/home_module/get_feature_model.dart';
import '../../view/home/menu/book_mark/get_bookmark_model.dart';
import '../../view/home/menu/subscription/subscription controller/pakage_subscription_model.dart';

class GetbookmarkProvider {
  late Dio client;

  GetbookmarkProvider({required this.client});

  getbookmarkApi() async {
    try {
      GetStorage prefs = GetStorage();

      Response r = await client.get('api/bookmark');
      if (r.statusMessage == 'OK') {
        token = prefs.read('token');
        print(token);
        //prefs.write('token', r.data['token']);

        print(token);
        return getbookmarkModelFromJson(

            //get upddate bookmark if you have  two list ................................................double list...................
            jsonEncode(r.data['data'][0]['course']));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
