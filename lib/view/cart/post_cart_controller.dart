import 'package:get/get.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/services/api_provider/post_cart_endpoint.dart';

import '../../services/api_client.dart';
import '../../services/api_provider/apply_cuppon_endpoint_provider.dart';

class PostCartController extends GetxController {
  GlobalKey<FormState> postcartCodekey = GlobalKey();

  postcartApi(var courseId) {
    Client _client = Client();
    PostcartProvider _postcartProvider =
        PostcartProvider(client: _client.init());
    _postcartProvider.postCartApi(courseId);
  }
}
