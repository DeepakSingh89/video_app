import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

import 'notification_controller.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  GetNotificationController _getNotificationController =
      Get.put(GetNotificationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => _getNotificationController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Stack(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            height: 13.h,
                          ),
                          SizedBox(
                            height: 83.h,
                            child: ListView.builder(
                              //physics: NeverScrollableScrollPhysics(),
                              itemCount: _getNotificationController
                                  .getNotificationModel.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Container(
                                          height: 7.h,
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(8),
                                              ),
                                              // ignore: prefer_const_literals_to_create_immutables
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.blueGrey,
                                                    blurRadius: 1)
                                              ]),
                                          child: Row(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              Image.asset(
                                                "assets/images/notification.png",
                                                height: 10.h,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    width: 60.w,
                                                    child: Text(
                                                      _getNotificationController
                                                          .getNotificationModel[
                                                              index]
                                                          .notification!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                  // Text(
                                                  //     '''_getNotificationController.getNotificationModel[index].notification ''')
                                                ],
                                              ),
                                              Spacer(),
                                              SizedBox(
                                                child: PopupMenuButton(
                                                  // child: Center(child: Text('click here')),
                                                  itemBuilder: (context) {
                                                    return List.generate(1,
                                                        (index) {
                                                      return PopupMenuItem(
                                                        child: Text('delete'),
                                                      );
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          )),
                                    ),
                                    SizedBox(height: 2.h),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    App_Bar(
                        icon: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.sort,
                            color: secondryColor,
                            size: 3.h,
                          ),
                        ),
                        title: 'Notification',
                        image1: Spacer(),
                        image2: Spacer()),
                  ],
                ),
        ),
      ),
    );
  }
}
