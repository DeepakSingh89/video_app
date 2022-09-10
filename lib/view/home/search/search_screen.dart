import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/search/search_controller.dart';
import 'package:raghu_education/constants/constant.dart';

import '../my_course/my course details/mycourse_details_screen.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  SearchController _searchController = Get.put(SearchController());

  List<String> searches = [
    'It & Softwares',
    'Business',
    'Finance',
    'Project Managment',
    'Marketing',
    'Health',
    'Development',
    'Productivity',
    'Accounting',
    'Teaching',
    'music'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: Obx(
          () => _searchController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 3.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            height: 5.6.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 1,
                                    color: Colors.blueGrey,
                                  )
                                ]),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 0.w,
                                ),
                                Container(
                                  height: 5.6.h,
                                  width: 75.w,
                                  child: TextField(
                                    controller: _searchController.search,
                                    onSubmitted: (value) {
                                      _searchController.GetsearchApi(value);
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: InkWell(
                                        onTap: () {
                                          //here we have ontap function in search  text field prefixx icon on tap,
                                          _searchController.GetsearchApi(
                                              _searchController.search.text);
                                        },
                                        child: Icon(
                                          Icons.search,
                                          size: 3.h,
                                        ),
                                      ),
                                      hintText: """Browse course name""",
                                    ),
                                  ),
                                ),
                                //Text("Browse course, mentor, topic etc"),
                                Spacer(),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                        height: 70.w,
                        child: ListView.builder(
                            itemCount: _searchController.getSearchModel.length,
                            shrinkWrap: true,
                            //physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                        Get.to(() => MyCourseDetails(),
                                          arguments: {
                                            "id": _searchController.getSearchModel[index].id,
                                            "isMyCourse": false
                                          });
                                      // Get.to(() => MyCourseDetails(
                                      //     course: _homeController
                                      //         .getcourseModel[index].name!,
                                      //     instructor: _homeController
                                      //         .getcourseModel[index]
                                      //         .instructor!,
                                      //     img: myCourse[index].img!,
                                      //     rating: myCourse[index].rating!,
                                      //     time: myCourse[index].time!));
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4.w),
                                      child: PhysicalModel(
                                        color: Colors.white,
                                        elevation: 5,
                                        child: Container(
                                          width: 100.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 12.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7HF0t45c7E_FTP3sEz8IrmmgZS5UgwMtK2g&usqp=CAU'
                                                            // _searchController
                                                            //     .getSearchModel[
                                                            //         index]
                                                            //     .courseImg!
                                                            ))),
                                              ),
                                              SizedBox(width: 2.w),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 50.w,
                                                    child: Text(
                                                      _searchController
                                                          .getSearchModel[index]
                                                          .name!,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2.h,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        _searchController
                                                            .getSearchModel[
                                                                index]
                                                            .instructor!,
                                                        //"- ${myCourse[index].instructor}",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 13.sp,
                                                            fontStyle: FontStyle
                                                                .italic),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Price:",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 13.sp,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic),
                                                          ),
                                                          Text(
                                                            _searchController
                                                                .getSearchModel[
                                                                    index]
                                                                .price
                                                                .toString(),
                                                            //"- ${myCourse[index].instructor}",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 13.sp,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 12.w,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  )
                                ],
                              );
                            }),
                      ),
                      Text(
                        "Top Searces",
                        style: TextStyle(
                            fontSize: 13.sp, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 3.4,
                      ),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 2.w,
                        runSpacing: 3.w,
                        children: [
                          for (var item in searches)
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 1,
                                      color: Colors.blueGrey,
                                    )
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp),
                                ),
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
