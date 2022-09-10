import 'package:get/get.dart';
import 'package:raghu_education/view/home/menu/book_mark/get_bookmark_model.dart';
import 'package:raghu_education/view/home/menu/subscription/subscription%20controller/pakage_subscription_model.dart';

import '../../../../../services/api_client.dart';
import '../../../../../services/api_provider/get_package_endpoint_provider.dart';
import '../../../../services/api_provider/get_bookmark_endpoint_provider.dart';

//...........

class GetBookmarkController extends GetxController {
  RxBool isLoading = true.obs;

  List<GetbookmarkModel> getBookmarkModel = [];

  @override
  void onInit() {
    GetbookmarkApi();

    super.onInit();
  }

  void GetbookmarkApi() async {
    Client _client = Client();
    GetbookmarkProvider bookmarkProvider =
        GetbookmarkProvider(client: _client.init());
    try {
      getBookmarkModel = await bookmarkProvider.getbookmarkApi();
      if (getBookmarkModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
