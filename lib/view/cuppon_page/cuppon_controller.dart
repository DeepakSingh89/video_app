import 'package:get/get.dart';
import 'package:raghu_education/view/home/menu/subscription/subscription%20controller/pakage_subscription_model.dart';

import '../../../../../services/api_client.dart';
import '../../../../../services/api_provider/get_package_endpoint_provider.dart';
import '../../services/api_provider/cuppon_get_endpoint_provider.dart';
import 'cuppon_model.dart';

//...........

class GetCupponController extends GetxController {
  RxBool isLoading = true.obs;

  List<GetCupponModel> getCupponModel = [];

  @override
  void onInit() {
    GetallcupponApi();

    //callApi();
    //allbannerApi();
    //featurebrandApi();
    super.onInit();
  }

  void GetallcupponApi() async {
    Client _client = Client();
    CupponProvider cupponProvider = CupponProvider(client: _client.init());
    try {
      getCupponModel = await cupponProvider.getcupponApi();
      if (getCupponModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
