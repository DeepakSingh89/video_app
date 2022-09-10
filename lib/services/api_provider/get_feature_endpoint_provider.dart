import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/home/models/get_banner_model.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

import '../../view/home/home_page/home_module/get_feature_model.dart';

class FeatureProvider {
  late Dio client;

  FeatureProvider({required this.client});

  featureApi() async {
    try {
      Response r = await client.get('api/get/fetured/course');
      if (r.statusMessage == 'OK') {
        //prefs.write('token', r.data['token']);

        print(token);
        return getFeatureModelFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
