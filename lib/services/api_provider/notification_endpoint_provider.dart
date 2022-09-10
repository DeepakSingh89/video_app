import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/home/models/get_banner_model.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';

import '../../view/home/home_page/notification/notification_model.dart';

class NotificationProvider {
  late Dio client;

  NotificationProvider({required this.client});

  notificationApi() async {
    try {
      Response r = await client.get('api/notifaction');
      if (r.statusMessage == 'OK') {
        //prefs.write('token', r.data['token']);

        print(token);
        return getNotificationModelFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
