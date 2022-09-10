import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/home/models/get_banner_model.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';
import '../../view/home/my_course/my course details/course ratings/course_get_revrating_model.dart';

class RatingrivewProvider {
  late Dio client;

  RatingrivewProvider({required this.client});

  getReviewByIdApi(String id) async {
    try {
      Response r = await client.get('/api/rating/courseid/$id');
      if (r.statusMessage == 'OK') {        
        print(token);
        return getratingrivewModelFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
