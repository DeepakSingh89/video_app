import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:raghu_education/widgets/commonLoader.dart';

class CheckOutEndPointProvider {
  Dio client;
  CheckOutEndPointProvider({
    required this.client,
  });

  Future<Map<String, dynamic>> checkOut() async {
    CommanLoader.loader();
    try {
      Response r = await client.post("api/checkout");
      log(r.data!.toString());
      CommanLoader.hideLoader();
      if (r.statusCode == 200) {
        return r.data;
      } else {
        return Future.error(r.data["error"]);
      }
    } on DioError catch (e) {
      log(e.response!.data.toString());
      CommanLoader.hideLoader();
      return Future.error(e.message);
    }
  }
}
