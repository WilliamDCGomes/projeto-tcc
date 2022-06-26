import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../controllers/register_user_controller.dart';

class RegisterUserTabletPhone extends StatefulWidget {
  const RegisterUserTabletPhone({Key? key}) : super(key: key);

  @override
  State<RegisterUserTabletPhone> createState() => _RegisterUserTabletPhoneState();
}

class _RegisterUserTabletPhoneState extends State<RegisterUserTabletPhone> {
  late RegisterUserController controller;

  @override
  void initState() {
    controller = Get.put(RegisterUserController());
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        controller.activeStep.value = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        return await controller.backButtonPressed();
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Material(
          child: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: AppColors.backgroundFirstScreenColor,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 2.h, 5.w, 0),
                    child: Scaffold(
                      backgroundColor: AppColors.transparentColor,
                      body: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButtonWidget(
                                  onTap: () => controller.backArrowButtonPressed(),
                                  widgetCustom: Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.purpleDefaultColor,
                                    size: 3.h,
                                  ),
                                  componentAlignment: Alignment.centerLeft,
                                  componentPadding: EdgeInsets.zero,
                                  width: 3.h,
                                ),
                                TextWidget(
                                  "Cadastro",
                                  textColor: AppColors.purpleDefaultColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                                SizedBox(
                                  width: 2.h,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.h),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Obx(
                                    () => controller.headerRegisterStepperList[controller.activeStep.value],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 2.h, 0, 3.h),
                                    child: Obx(
                                      () => Center(
                                        child: DotStepper(
                                          dotCount: 7,
                                          dotRadius: 1.h,
                                          activeStep: controller.activeStep.value,
                                          shape: Shape.circle,
                                          spacing: 3.w,
                                          indicator: Indicator.magnify,
                                          fixedDotDecoration: FixedDotDecoration(
                                            color: AppColors.grayStepColor,
                                          ),
                                          indicatorDecoration: IndicatorDecoration(
                                            color: AppColors.orangeColor,
                                          ),
                                          tappingEnabled: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => controller.bodyRegisterStepperList[controller.activeStep.value],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: ButtonWidget(
                              hintText: "AVANÇAR",
                              fontWeight: FontWeight.bold,
                              widthButton: 90.w,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                controller.nextButtonPressed();
                              },
                            ),
                          ),
                          Obx(() => controller.activeStep.value == 0 ?
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 75.w,
                                child: TextWidget(
                                  controller.lgpdPhrase,
                                  textColor: AppColors.blackColor,
                                  fontSize: 15.sp,
                                  textAlign: TextAlign.center,
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ) : SizedBox(height: 2.h),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                controller.loadingWithSuccessOrErrorWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
