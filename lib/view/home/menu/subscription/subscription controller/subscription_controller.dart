import 'package:get/get.dart';
import 'package:raghu_education/view/home/menu/subscription/subscription%20controller/pakage_subscription_model.dart';

import '../../../../../services/api_client.dart';
import '../../../../../services/api_provider/get_package_endpoint_provider.dart';

//...........
enum PaymentMethod { yearly, monthly }

class SubscriptionController extends GetxController {
  RxBool isLoading = true.obs;
  Rx<PaymentMethod> method = PaymentMethod.yearly.obs;
  onchaged(value) {
    method(value);
  }

  List<GetPackageModel> getpackageModel = [];

  @override
  void onInit() {
    allpackageApi();

    //callApi();
    //allbannerApi();
    //featurebrandApi();
    super.onInit();
  }

  void allpackageApi() async {
    Client _client = Client();
    PackageProvider packageProvider = PackageProvider(client: _client.init());
    try {
      getpackageModel = await packageProvider.getcourseApi();
      if (getpackageModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
