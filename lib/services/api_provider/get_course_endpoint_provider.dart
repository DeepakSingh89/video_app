import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/view/home/bottom%20bar/bottom_bar_screen.dart';
import 'package:raghu_education/view/home/models/get_banner_model.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:get/get.dart' as g;
import 'package:raghu_education/constants/constant.dart';
import '../../view/home/home_page/home_module/get_all_course_model.dart';

class CourseProvider {
  late Dio client;

  CourseProvider({required this.client});

  getcourseApi() async {
    try {
      Response r = await client.get('api/get/course');
      if (r.statusMessage == 'OK') {
        //prefs.write('token', r.data['token']);

        print(token);
        return getCourseModelFromJson(jsonEncode(r.data['getCourse']));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  getMyCoursesApi() async {
    try {
      Response r = await client.get('api/mycourse');
      if (r.statusMessage == 'OK') {        
        return getCourseModelFromJson(jsonEncode(r.data["courses"]));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }

  Future<GetCourseModel> getCourseByIdApi({required String Id}) async {
    try {
      Response r = await client.get('/api/single/course/$Id');
      if (r.statusMessage == 'OK') {
        //prefs.write('token', r.data['token']);
        return GetCourseModel.fromJson(r.data['getSingleCourse'][0]);
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
