import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../shared/widgets/text_button_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/grades_faults_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';

class GradesFaultsTabletPhonePage extends StatefulWidget {
  const GradesFaultsTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<GradesFaultsTabletPhonePage> createState() => _GradesFaultsTabletPhonePageState();
}

class _GradesFaultsTabletPhonePageState extends State<GradesFaultsTabletPhonePage> {
  late GradesFaultsController controller;

  @override
  void initState() {
    controller = Get.put(GradesFaultsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SvgPicture.asset(
                    Paths.Ilustracao_Topo,
                    width: 25.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TitleWithBackButtonWidget(
                                title: "Notas e Faltas",
                              ),
                              TextButtonWidget(
                                onTap: () {

                                },
                                height: 6.5.w,
                                width: 7.w,
                                componentPadding: EdgeInsets.all(.5.w),
                                widgetCustom: Center(
                                  child: Icon(
                                    Icons.download_rounded,
                                    size: 6.w,
                                    color: AppColors.purpleDefaultColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: PlatformType.isTablet(context) ? 9.h : 7.h,
                          ),
                          child: Center(
                            child: CarouselSlider.builder(
                              carouselController: controller.academicRecordCarouselController,
                              itemCount: controller.cardAcademicRecordList.length,
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: 100.h,
                                enlargeStrategy: CenterPageEnlargeStrategy.height,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                              ),
                              itemBuilder: (context, itemIndex, pageViewIndex) {
                                return controller.cardAcademicRecordList[itemIndex];
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}