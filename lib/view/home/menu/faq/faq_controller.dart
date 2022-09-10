import 'package:get/get.dart';
import 'package:raghu_education/view/home/menu/faq/faq_model.dart';
import '../../../../../services/api_client.dart';
import '../../../../services/api_provider/faq_endpoint_provider.dart';
import '../../../../services/api_provider/help_support_endpoint_provider.dart';

//...........

class FaqController extends GetxController {
  RxBool isLoading = true.obs;

  List<GetFaqModel> getfaqModel = [];

  @override
  void onInit() {
    GetfaqApi();

    super.onInit();
  }

  void GetfaqApi() async {
    Client _client = Client();
    FaqProvider faqProvider = FaqProvider(client: _client.init());
    try {
      getfaqModel = await faqProvider.getFaqApi();
      if (getfaqModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
