import 'package:get/get.dart';
import 'package:raghu_education/view/home/menu/faq/faq_model.dart';
import 'package:raghu_education/view/home/menu/mcq/mcq_model.dart';
import '../../../../../services/api_client.dart';
import '../../../../services/api_provider/faq_endpoint_provider.dart';
import '../../../../services/api_provider/help_support_endpoint_provider.dart';
import '../../../../services/api_provider/mcq_endpoint_provider.dart';

//...........

class McqController extends GetxController {
  RxBool isLoading = true.obs;

  List<GetMcqModel> getmcqModel = [];

  @override
  void onInit() {
    GetmcqApi();

    super.onInit();
  }

  void GetmcqApi() async {
    Client _client = Client();
    McqProvider mcqProvider = McqProvider(client: _client.init());
    try {
      getmcqModel = await mcqProvider.mcqApi();
      if (getmcqModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
