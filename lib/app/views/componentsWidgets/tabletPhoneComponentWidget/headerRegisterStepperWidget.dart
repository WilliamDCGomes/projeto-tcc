import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../stylePages/appColors.dart';
import '../textWidget.dart';

class HeaderRegisterStepperWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;

  const HeaderRegisterStepperWidget(
      { Key? key,
        required this.firstText,
        required this.secondText,
        required this.thirdText,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextWidget(
            firstText,
            textColor: AppColors().blackColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextWidget(
              secondText,
              textColor: AppColors().blackColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: TextWidget(
              thirdText,
              textColor: AppColors().blackColor,
              fontSize: 15.sp,
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}