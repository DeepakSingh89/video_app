import 'package:get/get.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/menu/faq/faq_model.dart';
import 'package:raghu_education/view/home/search/search_model.dart';
import '../../../../../services/api_client.dart';
import '../../../../services/api_provider/faq_endpoint_provider.dart';
import '../../../../services/api_provider/help_support_endpoint_provider.dart';

import '../../../services/api_provider/search_endpoint_provider.dart';

//...........

class SearchController extends GetxController {
  //GlobalKey<FormState> Searchkey = GlobalKey();
  TextEditingController search = TextEditingController();
  RxBool isLoading = false.obs;

  List<GetSearchModel> getSearchModel = [];

  @override
  void onInit() {
    super.onInit();
  }

  void GetsearchApi(String searchKey) async {
    isLoading(true);
    Client _client = Client();
    SearchProvider searchProvider = SearchProvider(client: _client.init());
    try {
      getSearchModel = await searchProvider.getSearchApi(searchKey);
      if (getSearchModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
