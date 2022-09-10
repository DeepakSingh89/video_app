import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';
import 'package:raghu_education/widgets/commonLoader.dart';
import 'package:raghu_education/constants/constant.dart';

import '../../view/home/bottom bar/bottom_bar_screen.dart';

class EditProfileEndPoint {
  Dio client;
  EditProfileEndPoint({required this.client});

  putupdateprofileApi(var name, var myField, var phone, var address) async {
    try {
      GetStorage prefs = GetStorage();
      CommanLoader.loader();
      var formData = FormData.fromMap({
        "name": name,
        "myField": await MultipartFile.fromFile(myField),
        "password": phone,
        "address": address,
      });

      Response r = await client.put('api/update/user', data: formData);
      print(r.statusCode);
      print(r.data);
      CommanLoader.hideLoader();
      if (r.statusCode == 200) {
        token = prefs.read('token');
        print(token);
        g.Get.to(() => BottomNavBarscreen());
      } else {
        print(r.data);
        CommanLoader.message(r.data['error']);
      }
    } on DioError catch (err) {
      CommanLoader.hideLoader();
      CommanLoader.message(err.message);
    }
  }
}
