import 'package:get/get.dart';
import '../../../../../services/api_client.dart';
import '../../../../services/api_provider/help_support_endpoint_provider.dart';
import 'help_and_support_model.dart';

//...........

class HelpSupportController extends GetxController {
  RxBool isLoading = true.obs;

  List<GetHelpSupportModel> gethelpsupportModel = [];

  @override
  void onInit() {
    GethelpsupportApi();

    //callApi();
    //allbannerApi();
    //featurebrandApi();
    super.onInit();
  }

  void GethelpsupportApi() async {
    Client _client = Client();
    HelpSupportProvider helpsupportProvider =
        HelpSupportProvider(client: _client.init());
    try {
      gethelpsupportModel = await helpsupportProvider.helpsupportsApi();
      if (gethelpsupportModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
