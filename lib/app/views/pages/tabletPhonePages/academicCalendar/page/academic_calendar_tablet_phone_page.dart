import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../shared/widgets/button_widget.dart';
import '../../shared/widgets/text_button_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/academic_calendar_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../shared/widgets/calendar_widget.dart';
import '../../../../stylePages/app_colors.dart';

class AcademicCalendarTabletPhonePage extends StatefulWidget {
  const AcademicCalendarTabletPhonePage({Key? key}) : super(key: key);

  @override
  State<AcademicCalendarTabletPhonePage> createState() => _AcademicCalendarTabletPhonePageState();
}

class _AcademicCalendarTabletPhonePageState extends State<AcademicCalendarTabletPhonePage> {
  late AcademicCalendarController controller;

  @override
  void initState() {
    controller = Get.put(AcademicCalendarController());
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
                                title: "Calendário Acadêmico",
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
                          padding: EdgeInsets.only(top: 5.h),
                          child: CalendarWidget(
                            dataSource: controller.getDataSource(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: ButtonWidget(
                          hintText: "COMPARTILHAR",
                          fontWeight: FontWeight.bold,
                          widthButton: 100.w,
                          backgroundColor: AppColors.orangeColor,
                          textColor: AppColors.whiteColor,
                          onPressed: () {

                          },
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