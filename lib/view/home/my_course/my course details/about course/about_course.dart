// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:intl/intl.dart';
import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/constants/constant.dart';
import 'package:raghu_education/view/home/home_page/home_module/get_all_course_model.dart';

class AboutCourse extends StatelessWidget {
  AboutCourse({
    Key? key,
    required this.courseModel,
  }) : super(key: key);
  GetCourseModel courseModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.h,
        ),
        child: Column(children: [
          PhysicalModel(
            color: Colors.blueGrey,
            elevation: 7,
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 2.3.w,
                vertical: 1.h,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Course Breif",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 0.7.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.timelapse_outlined,
                        size: 4.h,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Timimg",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 10.sp),
                          ),
                          Text(
                            courseModel.totelTimeOfCourse,
                            style:
                                TextStyle(color: primaryColor, fontSize: 12.sp),
                          )
                        ],
                      ),
                      SizedBox(width: 16.4.w),
                      Icon(
                        Icons.tv,
                        color: primaryColor,
                        size: 4.h,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Lectures",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 10.sp),
                          ),
                          Text(
                            courseModel.lecture.length.toString(),
                            style:
                                TextStyle(color: primaryColor, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.security,
                        size: 4.h,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Accessibility",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 10.sp),
                          ),
                          Text(
                            "Lifetime",
                            style:
                                TextStyle(color: primaryColor, fontSize: 12.sp),
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.calendar_today,
                        color: primaryColor,
                        size: 4.h,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course Updated",
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 10.sp),
                          ),
                          Text(
                            DateFormat.yMMMd().format(courseModel.createdAt),
                            style:
                                TextStyle(color: primaryColor, fontSize: 12.sp),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          PhysicalModel(
            color: Colors.blueGrey,
            elevation: 7,
            borderRadius: BorderRadius.all(
              Radius.circular(7),
            ),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal: 2.3.w,
                vertical: 1.h,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(courseModel.descrption),
                  SizedBox(
                    height: 3.h,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
