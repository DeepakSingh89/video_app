import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:raghu_education/constants/constant.dart';
import '../../view/home/profile/get_user_profile_model.dart';

class GetUserProvider {
  late Dio client;

  GetUserProvider({required this.client});

  getuserApi() async {
    try {
      Response r = await client.get('api/user');
      if (r.statusMessage == 'OK') {
        //prefs.write('token', r.data['token']);        
        return getUserModelFromJson(jsonEncode(r.data));
      } else {
        return Future.error(r.statusMessage.toString());
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
