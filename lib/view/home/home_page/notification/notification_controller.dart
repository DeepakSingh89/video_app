import 'package:get/get.dart';
import 'package:raghu_education/view/home/home_page/notification/notification_model.dart';
import 'package:raghu_education/view/home/menu/subscription/subscription%20controller/pakage_subscription_model.dart';

import '../../../../../services/api_client.dart';
import '../../../../../services/api_provider/get_package_endpoint_provider.dart';
import '../../../../services/api_provider/notification_endpoint_provider.dart';

//...........

class GetNotificationController extends GetxController {
  RxBool isLoading = true.obs;

  List<GetNotificationModel> getNotificationModel = [];

  @override
  void onInit() {
    GetnotificationApi();

    //callApi();
    //allbannerApi();
    //featurebrandApi();
    super.onInit();
  }

  void GetnotificationApi() async {
    Client _client = Client();
    NotificationProvider notificationProvider =
        NotificationProvider(client: _client.init());
    try {
      getNotificationModel = await notificationProvider.notificationApi();
      if (getNotificationModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
