import 'package:get/get.dart';
import 'package:raghu_education/constants/constant.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/home_page/home_module/get_all_course_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../../../services/api_client.dart';
import '../../../../../../../services/api_provider/get_course_endpoint_provider.dart';

class VideoLectureController extends GetxController
    with StateMixin<GetCourseModel> {
  YoutubePlayerController ytController = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
  );
  RxBool isLoader = true.obs;

  /* intializeVideo() {
    controller = VideoPlayerController.network(source)
      ..addListener(() => update())
      ..setLooping(true)
      ..initialize().then((_) {
        controller!.play();
        update();
        isLoader.value = false;
      });
  } */

  String id = Get.arguments;

  callGetCourseByIdApi() {
    Client client = Client();
    CourseProvider courseProvider = CourseProvider(client: client.init());
    courseProvider.getCourseByIdApi(Id: id).then((value) {
      
      //giving source to first video in course
      for (var lecture in value.lecture) {
        if (lecture.contentType == url) {
          String? videoId = YoutubePlayer.convertUrlToId(lecture.content);
          if (videoId != null) {
            ytController.load(videoId);
          }
          break;
        }
      }
      change(value, status: RxStatus.success());
      //intializeVideo();
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  @override
  void onInit() {
    callGetCourseByIdApi();
    super.onInit();
  }
}
