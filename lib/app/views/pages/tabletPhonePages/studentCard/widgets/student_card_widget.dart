import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/platform_type.dart';
import 'information_student_card_widget.dart';

class StudentCardWidget extends StatelessWidget {
  final String imageBasePath;
  final String cardNumber;
  final String raNumber;
  final String nameStudent;
  final String validateCard;

  const StudentCardWidget(
      { Key? key,
        required this.imageBasePath,
        required this.cardNumber,
        required this.raNumber,
        required this.nameStudent,
        required this.validateCard,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            imageBasePath,
            height: PlatformType.isPhone(context) ? 22.h : 25.h,
            width: 80.w,
            fit: BoxFit.fill,
          ),
        ),
        InformationStudentCardWidget(
          cardNumber: cardNumber,
          raNumber: raNumber,
          nameStudent: nameStudent,
          validateCard: validateCard,
        ),
      ],
    );
  }
}