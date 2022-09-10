import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/menu/help%20n%20support/help_support_controller.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

class HelpnSupportScreen extends StatelessWidget {
  HelpnSupportScreen({Key? key}) : super(key: key);

  HelpSupportController _helpSupportController =
      Get.put(HelpSupportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Obx(
        () => _helpSupportController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                //fit: StackFit.expand,
                children: [
                  SizedBox(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          _helpSupportController.gethelpsupportModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 4.h, right: 4.h, top: 25.h, bottom: 25.h),
                          child: PhysicalModel(
                            color: Colors.blueGrey,
                            elevation: 10,
                            borderRadius:
                                BorderRadius.all(const Radius.circular(10)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: secondryColor,
                                borderRadius: BorderRadius.all(
                                  const Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 2.w,
                                  vertical: 1.h,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/location.png",
                                          height: 4.h,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Address",
                                              style: TextStyle(
                                                  color: texxtcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp),
                                            ),
                                            Text(
                                              _helpSupportController
                                                  .gethelpsupportModel[index]
                                                  .address!,
                                              style: TextStyle(
                                                  color: texxtcolor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/Rectangle 3047.png",
                                          height: 4.h,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Contact",
                                              style: TextStyle(
                                                  color: texxtcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp),
                                            ),
                                            Text(
                                              _helpSupportController
                                                  .gethelpsupportModel[index]
                                                  .contact
                                                  .toString(),

                                              //'''+91 1234567890''',
                                              style: TextStyle(
                                                  color: texxtcolor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/images/message.png",
                                          height: 4.h,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mail",
                                              style: TextStyle(
                                                  color: texxtcolor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 15.sp),
                                            ),
                                            Text(
                                              _helpSupportController
                                                  .gethelpsupportModel[index]
                                                  .mail!,

                                              //'''abc@gmail.com''',
                                              style: TextStyle(
                                                  color: texxtcolor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: 3.h,
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 4.h, right: 4.h, top: 25.h, bottom: 31.h),
                    child: PhysicalModel(
                      color: Colors.blueGrey,
                      elevation: 10,
                      borderRadius: BorderRadius.all(const Radius.circular(10)),
                      child: Container(
                        decoration: BoxDecoration(
                          color: secondryColor,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 1.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/location.png",
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Address",
                                        style: TextStyle(
                                            color: texxtcolor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      Text(
                                        '''Lorem Ipsum is simply dummy text
of the printing and typesetting industry''',
                                        style: TextStyle(
                                            color: texxtcolor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/Rectangle 3047.png",
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Contact",
                                        style: TextStyle(
                                            color: texxtcolor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      Text(
                                        '''+91 1234567890''',
                                        style: TextStyle(
                                            color: texxtcolor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/message.png",
                                    height: 5.h,
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Mail",
                                        style: TextStyle(
                                            color: texxtcolor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp),
                                      ),
                                      Text(
                                        '''abc@gmail.com''',
                                        style: TextStyle(
                                            color: texxtcolor,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 11.sp),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              // SizedBox(
                              //   height: 3.h,
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    child: App_Bar(
                      icon: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: secondryColor,
                          size: 3.h,
                        ),
                      ),
                      title: "Help and Support",
                      image1: Spacer(),
                      image2: Image.asset(
                        "assets/images/message.png",
                        height: 3.h,
                      ),
                    ),
                  )
                ],
              )),
      ),
    );
  }
}
