// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/profile/get_user_controller.dart';
import 'package:raghu_education/view/home/profile_edit.dart/profile_edit_controller.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

class EditProfilescreen extends StatelessWidget {
  EditProfilescreen({Key? key}) : super(key: key);
  ProfileeditController _profileeditController =
      Get.put(ProfileeditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _profileeditController.editProfilekey,
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),

                InkWell(
                  onTap: () {
                    _profileeditController.getImage();
                  },
                  child: Container(
                    height: 22.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      color: Color(0xff120d3d),

                      // image: DecorationImage(
                      //   image: AssetImage('lib/assets/asset/video_players.png'),
                      // )
                    ),
                    child: Center(
                        child: _profileeditController.myField.value.path == ''
                            ? ClipOval(
                                child: Container(
                                    height: 22.h,
                                    width: 22.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.transparent,
                                        ),
                                        color: Color(0xff120d3d),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmVzc2lvbmFsfG'
                                                'VufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60')))))
                            : ClipOval(
                                child: Image.file(
                                    _profileeditController.myField.value,
                                    fit: BoxFit.cover))

                        // child: Image.asset('lib/assets/images/image.png',fit: BoxFit.cover,)

                        // ? Image.asset('lib/assets/asset/aadharchange.png')
                        //  : ClipOval(child: Image.file(_personalDetailController.image.value,fit: BoxFit.cover))
                        ),
                  ),
                ),

                // from here different path ..............
                // Center(
                //   child: Image.asset(
                //     "assets/images/profile icon.png",
                //     height: 18.h,
                //   ),
                // ),
                SizedBox(
                  height: 3.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
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
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Column(
                        children: [
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

                              Container(
                                height: 3.h,
                                width: 65.w,
                                child: TextFormField(
                                  controller: _profileeditController.name,
                                  validator:
                                      _profileeditController.namevalidation,
                                  decoration: InputDecoration(
                                    hintText: """name""",
                                    //hintStyle: Colors.black,
                                  ),
                                ),
                              ),
                              // Text(
                              //   "Jhone Doe",
                              //   style: TextStyle(fontSize: 13.sp),
                              // )
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
                              Container(
                                height: 5.h,
                                width: 65.w,
                                child: TextFormField(
                                  controller: _profileeditController.address,
                                  validator:
                                      _profileeditController.addressvalidation,
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    hintText: """Address""",
                                    //hintStyle: Colors.black,
                                  ),
                                ),
                              ),
                              // Text(
                              //   "San Francisco, CA",
                              //   style: TextStyle(fontSize: 13.sp),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
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
                              Container(
                                height: 3.h,
                                width: 65.w,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: """Email""",
                                    //hintStyle: Colors.black,
                                  ),
                                ),
                              ),
                              // Text(
                              //   "satyam@flyweis.com",
                              //   style: TextStyle(fontSize: 13.sp),
                              // )
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
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
                              Container(
                                height: 3.h,
                                width: 65.w,
                                child: TextFormField(
                                  controller: _profileeditController.phone,
                                  validator:
                                      _profileeditController.phonevalidation,
                                  decoration: InputDecoration(
                                    hintText: """Number""",
                                    //hintStyle: Colors.black,
                                  ),
                                ),
                              ),
                              // Text(
                              //   "+91 1234567890",
                              //   style: TextStyle(fontSize: 13.sp),
                              // )
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
                  height: 8.h,
                ),
                PhysicalModel(
                  elevation: 5,
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: InkWell(
                    onTap: () {
                      // from here you are callin Api it is a form data method.............................
                      _profileeditController.checkuserupdate();
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 3.w),
                      height: 6.h,
                      width: 85.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: primaryColor),
                      child: Center(
                        child: Text(
                          'Update User',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
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
