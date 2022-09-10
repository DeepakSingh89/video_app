import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:raghu_education/services/api_client.dart';

import '../../../services/api_provider/banner_endpoint_provider.dart';
import '../../../services/api_provider/catagary_endpoint_provider.dart';
import '../../../services/api_provider/get_course_endpoint_provider.dart';
import '../../../services/api_provider/get_feature_endpoint_provider.dart';
import '../home_page/home_module/get_all_catagary_model.dart';
import '../home_page/home_module/get_all_course_model.dart';
import '../home_page/home_module/get_feature_model.dart';
import '../models/get_banner_model.dart';

class HomeController extends GetxController {
  RxBool isLoading = true.obs;

  // late  GetUserCommentsModel viewcomment;
  // void callApi() async {
  //   http.Response r= await ApiProvider.getusercommentApi();
  //   if (r.statusCode==200) {
  //     viewcomment= getUserCommentsModelFromJson(r.body);
  //     isLoading(false);
  //   }

  //CategoryModel getcatarory = CategoryModel();

  //GetallProductModel getallProductModel =GetallProductModel();

  //GetproductbyCatModel getproductbyCatModel = GetproductbyCatModel();

  List<GetBannerModel> getbannerModel = [];
  List<GetFeatureModel> getfeatureModel = [];
  List<GetCourseModel> getcourseModel = [];
  List<GetCourseModel> getMyCourseModel = [];
  List<GetCatagaryModel> getcatagaryModel = [];

  //late FeatureModel getfeatureModel;

  @override
  void onInit() {
    allbannerApi();
    allfeatureApi();
    catagaryApi();
    courseApi();
    myCourseApi();
    //callApi();
    //allbannerApi();
    //featurebrandApi();
    super.onInit();
  }

  // void callApi() async {
  //
  //   http.Response r= await ApiProvider.getcategoryApi();
  //   print(r.statusCode);
  //   print(r.body);
  //   if (r.statusCode==201) {
  //     getcatarory= categoryModelFromJson(r.body);
  //     //isLoading.value = false;
  //   }else{
  //     //isLoading.value = false;
  //
  //     print(r.statusCode);
  //   }
  //
  // }

  // void productbycatApi(var id , String ? title) async {
  //
  //   http.Response r= await ApiProvider.getcatprodctApi(id);
  //   print(r.statusCode);
  //   print(r.body);
  //   if (r.statusCode==200) {
  //     getproductbyCatModel = getproductbyCatModelFromJson(r.body);
  //     //isLoading.value = false;
  //     Get.to(()=>ProductDetails(
  //         title: title,
  //         product: getproductbyCatModel
  //     ));
  //   }else{
  //     //isLoading.value = false;
  //
  //     print(r.statusCode);
  //   }
  //
  // }

  ///todo..............banner api.....
  void allbannerApi() async {
    Client _client = Client();
    BannerProvider bannerProvider = BannerProvider(client: _client.init());
    try {
      getbannerModel = await bannerProvider.bannerApi();
      if (getbannerModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }

  //get all feature  api......................

  void allfeatureApi() async {
    Client _client = Client();
    FeatureProvider featureProvider = FeatureProvider(client: _client.init());
    try {
      getfeatureModel = await featureProvider.featureApi();
      if (getfeatureModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }

  //get all course api.................................

  void courseApi() async {
    Client _client = Client();
    CourseProvider courseProvider = CourseProvider(client: _client.init());
    try {
      getcourseModel = await courseProvider.getcourseApi();
      if (getcourseModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }
  //get all course api.................................

  void myCourseApi() async {
    Client _client = Client();
    CourseProvider courseProvider = CourseProvider(client: _client.init());
    try {
      getMyCourseModel = await courseProvider.getMyCoursesApi();
      if (getMyCourseModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }

  //get all catagary api..................................

  void catagaryApi() async {
    Client _client = Client();
    CatagaryProvider catagaryProvider =
        CatagaryProvider(client: _client.init());
    try {
      getcatagaryModel = await catagaryProvider.catagaryApi();
      if (getcatagaryModel.isNotEmpty) {
        isLoading.value = false;
      } else {
        //isLoading.value = false;
      }
    } on Exception catch (e) {}
  }

  // void featurebrandApi() async {
  //
  //   try {
  //     getfeatureModel = await ApiProvider.getfeaturebrandApi();
  //     if (getfeatureModel != null) {
  //       ////getbannerModel= getbannerModelFromJson(r.body);
  //       isLoading.value = false;
  //     }else{
  //       //isLoading.value = false;
  //     }
  //   } on Exception catch (e) {
  //
  //     // TODO
  //   }
  //
  // }

}
