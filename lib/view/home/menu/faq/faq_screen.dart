import 'package:raghu_education/import_files.dart';
import 'package:raghu_education/view/home/menu/faq/faq_controller.dart';
import 'package:raghu_education/widgets/app_bar.dart';
import 'package:raghu_education/constants/constant.dart';

class FaqScreen extends StatelessWidget {
  FaqScreen({Key? key}) : super(key: key);
  FaqController _faqController = Get.put(FaqController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _faqController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SafeArea(
                child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: _faqController.getfaqModel.length,
                              itemBuilder: (context, index1) {
                                return Column(
                                  children: [
                                    ExpansionTile(
                                      title: Text(_faqController
                                              .getfaqModel[index1].title!
                                          //"How Can we help you"
                                          ),
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.w, vertical: 2.h),
                                          child: ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              itemCount: _faqController
                                                  .getfaqModel.length,
                                              itemBuilder: (context, index2) {
                                                return Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons.circle,
                                                          size: 2.h,
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Text(_faqController
                                                            .getfaqModel[index1]
                                                            .answer![index2])

                                                        //"Lorem Ipsum is simply dummy text of the \nprinting and typesetting industry. Lorem \nIpsum has been the industry's standard dummy"),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                  ],
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    )
                                  ],
                                );
                              })
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
                      title: "           FAQs",
                      image1: SizedBox(),
                      image2: SizedBox())
                ],
              )),
      ),
    );
  }
}
