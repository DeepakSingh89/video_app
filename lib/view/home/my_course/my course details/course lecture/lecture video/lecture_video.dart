import 'package:raghu_education/view/home/my_course/my%20course%20details/course%20lecture/course_lecture.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/course%20lecture/lecture%20video/controller/video_lecture_controller.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/course%20lecture/notes/notes_view.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LectureVideo extends GetView<VideoLectureController> {
  LectureVideo({
    Key? key,
  }) : super(key: key);

  VideoLectureController _videoLectureController =
      Get.put(VideoLectureController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => SafeArea(
            child: Stack(
          children: [
            YoutubePlayerBuilder(
                player: YoutubePlayer(
                    controller: controller.ytController,
                    showVideoProgressIndicator: true,
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(isExpanded: true),
                      FullScreenButton()
                    ]),
                builder: (context, player) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      player,
                      SizedBox(
                        height: 4.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: PhysicalModel(
                          color: Colors.blueGrey,
                          elevation: 10,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 2.w,
                                vertical: 1.h,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state!.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "- by " + state.instructor,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                            color: Colors.grey,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Spacer(),
                                      Container(
                                        height: 3.h,
                                        width: 13.w,
                                        color: Color(0xFFE5C231),
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                state.rating.toString(),
                                                style: TextStyle(
                                                    color: Color(0xFF614E01),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 13.sp),
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 2.3.h,
                                                color: Color(0xFF614E01),
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  /* Row(
                              children: [
                                Text("About"),
                                Spacer(),
                                Text(
                                  "Videos",
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                Text("Reviews")
                              ],
                            ) */
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Text(
                          "Lecture Videos",
                          style: TextStyle(
                              fontSize: 13.sp,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: state.lecture.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (state.lecture[index].contentType == url) {
                                return InkWell(
                                  onTap: () {
                                    //change video source and reintialize
                                    String? videoId =
                                        YoutubePlayer.convertUrlToId(
                                            state.lecture[index].content);
                                    if (videoId != null) {
                                      controller.ytController.load(videoId);
                                    }
                                    //controller.intializeVideo();
                                  },
                                  child: VideoWidget(
                                    title: state.lecture[index].title,
                                  ),
                                );
                              } else if (state.lecture[index].contentType ==
                                  notes) {
                                return InkWell(
                                  onTap: () {
                                    //download notes
                                    Get.to(() => NotesView(),
                                        arguments:
                                            state.lecture[index].content);
                                  },
                                  child: NoteWidget(
                                    notesUrl: state.lecture[index].content,
                                    title: state.lecture[index].title,
                                  ),
                                );
                              } else {
                                return SizedBox();
                              }
                            }),
                      ),
                    ],
                  );
                }),
            App_Bar(
                icon: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 3.h,
                    color: Colors.white,
                  ),
                ),
                title: "My Course",
                image1: Image.asset(
                  "assets/images/bell.png",
                  height: 4.h,
                ),
                image2: Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/j6teixhgksmh0v0y9f5i/the-game-accuser-awarded-control-over-his-record-label?fimg-ssr"),
                        )))),
          ],
        )),
      ),
    );
  }
}
