import 'package:get/get.dart';
import 'package:raghu_education/view/home/menu/faq/faq_model.dart';
import 'package:raghu_education/view/home/menu/mcq/mcq_model.dart';
import 'package:raghu_education/view/home/profile/get_user_profile_model.dart';
import '../../../../../services/api_client.dart';
import '../../../../services/api_provider/faq_endpoint_provider.dart';
import '../../../../services/api_provider/help_support_endpoint_provider.dart';
import '../../../../services/api_provider/mcq_endpoint_provider.dart';
import '../../../services/api_provider/get_user_endpoint_provider.dart';

//...........

class GetUserController extends GetxController {
  RxBool isLoading = true.obs;

  GetUserModel? getuserModel;

  @override
  void onInit() {
    GetuserApi();

    super.onInit();
  }

  void GetuserApi() async {
    Client _client = Client();
    GetUserProvider getuserProvider = GetUserProvider(client: _client.init());
    try {
      getuserModel = await getuserProvider.getuserApi();
      if (getuserModel != null) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
