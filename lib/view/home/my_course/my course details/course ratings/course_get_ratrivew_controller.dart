import 'package:get/get.dart';
import 'package:raghu_education/view/home/home_page/notification/notification_model.dart';
import 'package:raghu_education/view/home/menu/subscription/subscription%20controller/pakage_subscription_model.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/course%20ratings/course_get_revrating_model.dart';

import '../../../../../services/api_client.dart';
import '../../../../../services/api_provider/get_package_endpoint_provider.dart';
import '../../../../../services/api_provider/get_ratrivew_endpoint_provider.dart';

//...........

class GetratingRivewsController extends GetxController {
  String courseId = "";
  RxBool isLoading = true.obs;
  int oneStar = 0;
  int twoStar = 0;
  int threeStar = 0;
  int fourStar = 0;
  int fiveStar = 0;
  List<GetratingrivewModel> getratrivewModel = [];

  @override
  void onInit() {
    //GetratrivewApi();

    //callApi();
    //allbannerApi();
    //featurebrandApi();
    super.onInit();
  }

  void getRatRivewApi() async {
    Client _client = Client();
    RatingrivewProvider ratreviewProvider =
        RatingrivewProvider(client: _client.init());
    try {
      getratrivewModel = await ratreviewProvider.getReviewByIdApi(courseId);
      if (getratrivewModel.isNotEmpty) {
        for (var item in getratrivewModel) {
          if (item.rating == 1) {
            oneStar++;
          }
          if (item.rating == 2) {
            twoStar++;
          }
          if (item.rating == 3) {
            threeStar++;
          }
          if (item.rating == 4) {
            fourStar++;
          }
          if (item.rating == 5) {
            fiveStar++;
          }
        }
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
}
