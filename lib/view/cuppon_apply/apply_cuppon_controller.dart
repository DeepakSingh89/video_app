import 'package:get/get.dart';
import 'package:raghu_education/import_files.dart';

import '../../services/api_client.dart';
import '../../services/api_provider/apply_cuppon_endpoint_provider.dart';

class CouponCodeController extends GetxController {
  GlobalKey<FormState> couponCodekey = GlobalKey();
  TextEditingController couponCode = TextEditingController();

  String? couponCodevalidation(value) {
    if (value == '') {
      return 'enter your Cuppon Code';
    }
    return null;
  }

  checkcouponCode() {
    final isvalidate = couponCodekey.currentState!.validate();
    if (!isvalidate) {
      return;
    } else {
      callcouponCodeApi();
    }
    couponCodekey.currentState!.save();
  }

  callcouponCodeApi() {
    Client _client = Client();
    CodeProvider _codeProvider = CodeProvider(client: _client.init());
    _codeProvider.cupponCodeApi(couponCode.text);
  }
}
