import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/home_page/home_module/get_all_course_model.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/course%20lecture/lecture%20video/lecture_video.dart';
import 'package:raghu_education/constants/constant.dart';
import 'package:raghu_education/view/home/my_course/my%20course%20details/course%20lecture/notes/notes_view.dart';

class CourseLecture extends StatelessWidget {
  CourseLecture(
      {Key? key,
      required this.lectures,
      required this.isMyCourse,
      required this.courseId})
      : super(key: key);
  List<Lecture> lectures;
  bool isMyCourse;
  String courseId; //to call api in next screen
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lecture Videos",
              style: TextStyle(
                  fontSize: 13.sp,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 3.h),
            ListView.builder(
                shrinkWrap: true,
                itemCount: lectures.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (lectures[index].contentType == url) {
                    return InkWell(
                      onTap: () {
                        if (isMyCourse)
                          Get.to(() => LectureVideo(), arguments: courseId);
                      },
                      child: VideoWidget(
                        title: lectures[index].title,
                      ),
                    );
                  } else if (lectures[index].contentType == notes) {
                    return InkWell(
                      onTap: () {
                        if (isMyCourse)
                          Get.to(() => NotesView(),
                              arguments: lectures[index].content);
                        //Get.to(() => LectureVideo(), arguments: courseId);
                      },
                      child: NoteWidget(
                        notesUrl: lectures[index].content,
                        title: lectures[index].title,
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class VideoWidget extends StatelessWidget {
  const VideoWidget({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: PhysicalModel(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Colors.blueGrey,
        elevation: 8,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: Row(
            children: [
              Container(
                height: 6.h,
                width: 7.h,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Center(
                  child: Icon(
                    Icons.play_circle,
                    color: primaryColor,
                    size: 3.h,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({Key? key, required this.notesUrl, required this.title})
      : super(key: key);
  final String notesUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: PhysicalModel(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        color: Colors.blueGrey,
        elevation: 8,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 2.w,
            vertical: 1.h,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: Row(
            children: [
              Container(
                height: 6.h,
                width: 7.h,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.all(Radius.circular(6))),
                child: Center(
                  child: Icon(
                    Icons.question_answer,
                    size: 3.h,
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(title),
              Spacer(),
              // Icon(Icons.download)
            ],
          ),
        ),
      ),
    );
  }
}
