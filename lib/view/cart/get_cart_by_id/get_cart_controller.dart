import 'package:get/get.dart';

import '../../../../../services/api_client.dart';
import '../../../services/api_provider/getcart_byId_endpoint.dart';
import 'get_cart_model.dart';

//...........

class GetCartController extends GetxController {
  RxBool isLoading = true.obs;

  GetCartModel getcatmodel = GetCartModel();

  @override
  void onInit() {
    getcartApi();

    //callApi();
    //allbannerApi();
    //featurebrandApi();
    super.onInit();
  }

  void getcartApi() async {
    Client _client = Client();
    GetCartProvider cartProvider = GetCartProvider(client: _client.init());
    try {
      getcatmodel = await cartProvider.getcartApi();
      if (getcatmodel != Null) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
