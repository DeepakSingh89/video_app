// ignore_for_file: prefer_const_constructors

import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/menu/mcq/mcq_controller.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';
import 'package:sizer/sizer.dart';

class McqScreen extends StatelessWidget {
  McqScreen({Key? key}) : super(key: key);

  McqController _mcqController = Get.put(McqController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Obx(
        () => _mcqController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 14.h,
                            ),
                            Text(
                              "Questions 1 of 10",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            ListView.builder(
                                itemCount: _mcqController.getmcqModel.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index1) {
                                  return Column(
                                    children: [
                                      Text(
                                        "1: ${_mcqController.getmcqModel[index1].title!}",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      SizedBox(
                                        child: ListView.builder(
                                            itemCount: _mcqController
                                                .getmcqModel.length,
                                            shrinkWrap: true,
                                            //physics:NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index2) {
                                              return Center(
                                                child: PhysicalModel(
                                                  color: Colors.blueGrey,
                                                  elevation: 4,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  child: Container(
                                                    height: 8.h,
                                                    width: 80.w,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFE9E9E9),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    child: Center(
                                                      child: Text(
                                                        _mcqController
                                                            .getmcqModel[index1]
                                                            .qustion![index2],

                                                        //' How can we resolve the issue, and \n    all the other problem',
                                                        style: TextStyle(
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                    ],
                                  );
                                }),
                            SizedBox(
                              height: 2.h,
                            ),
                            Center(
                              child: PhysicalModel(
                                color: Colors.blueGrey,
                                elevation: 4,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  height: 8.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE9E9E9),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  child: Center(
                                    child: Text(
                                      ' How can we resolve the issue, and \n    all the other problem',
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Center(
                              child: Container(
                                height: 6.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: secondryColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    App_Bar(
                        icon: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: secondryColor,
                          ),
                        ),
                        title: "                         MCQs",
                        image1: SizedBox(),
                        image2: SizedBox())
                  ],
                ),
              ),
      ),
    );
  }
}
