import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/services/api_client.dart';
import 'package:raghu_education/view/home/profile/get_user_controller.dart';
import 'package:raghu_education/view/home/profile_edit.dart/profile_edit_page.dart';
import 'package:raghu_education/constants/constant.dart';

class MyProfilescreen extends StatelessWidget {
  MyProfilescreen({Key? key}) : super(key: key);
  GetUserController _getUserController = Get.put(GetUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Obx(
        () => _getUserController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),

                      Image.network(
                        Client().baseUrl +
                            _getUserController.getuserModel!.avatar
                                .toString(), // this image doesn't exist
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 18.h,
                            width: 18.h,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(100),                              
                            ),
                            alignment: Alignment.center,
                            child: Center(
                              child: Image.asset(
                                "assets/images/profile icon.png",
                                height: 18.h,
                              ),
                            ),
                          );
                        },
                      ),

                      //from here we have one  profile......................

                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 2.h),
                        child: PhysicalModel(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          elevation: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 1.h,
                              horizontal: 2.w,
                            ),
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => EditProfilescreen());
                                      },
                                      child: Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                        size: 2.h,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => EditProfilescreen());
                                      },
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      color: primaryColor,
                                      size: 3.h,
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      _getUserController.getuserModel!.name
                                          .toString(),
                                      //"Jhone Doe",
                                      style: TextStyle(fontSize: 13.sp),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: primaryColor,
                                      size: 3.h,
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      _getUserController.getuserModel!.address
                                          .toString(),
                                      //"San Francisco, CA",
                                      style: TextStyle(fontSize: 13.sp),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.email,
                                      color: primaryColor,
                                      size: 3.h,
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      _getUserController.getuserModel!.email
                                          .toString(),
                                      //"satyam@flyweis.com",
                                      style: TextStyle(fontSize: 13.sp),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone,
                                      color: primaryColor,
                                      size: 3.h,
                                    ),
                                    SizedBox(
                                      width: 7.w,
                                    ),
                                    Text(
                                      _getUserController.getuserModel!.phone
                                          .toString(),
                                      // "+91 1234567890",
                                      style: TextStyle(fontSize: 13.sp),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Reference Id : ASDBBQ255",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Reference Link",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      PhysicalModel(
                        elevation: 5,
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Container(
                          padding: EdgeInsets.only(left: 3.w),
                          height: 6.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              color: secondryColor),
                          child: Row(
                            children: [
                              Text(
                                "https://www.asufihf9.com",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp),
                              ),
                              Spacer(),
                              Container(
                                height: 6.h,
                                width: 16.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    color: primaryColor),
                                child: Center(
                                  child: Icon(
                                    Icons.copy,
                                    color: secondryColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
