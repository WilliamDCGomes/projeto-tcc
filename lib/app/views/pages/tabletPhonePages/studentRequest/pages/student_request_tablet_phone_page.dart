import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/format_numbers.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/dropdown_button_widget.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/information_container_tablet_phone_widget.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/student_request_tablet_phone_controller.dart';

class StudentRequestTablePhonePage extends StatefulWidget {
  final studentTypeRequest studentRequest;

  StudentRequestTablePhonePage({
    Key? key,
    required this.studentRequest,
  }) : super(key: key);

  @override
  State<StudentRequestTablePhonePage> createState() => _StudentRequestTablePhonePageState();
}

class _StudentRequestTablePhonePageState extends State<StudentRequestTablePhonePage> {
  late StudentRequestTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(StudentRequestTabletPhoneController(widget.studentRequest), tag: "student-request-tablet-phone-controller");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.transparentColor,
          body: Container(
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
                  padding: EdgeInsets.only(top: 2.h,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.h,),
                        child: TitleWithBackButtonTabletPhoneWidget(
                          title: "Solicita????es",
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => InformationContainerTabletPhoneWidget(
                                iconPath: controller.imageIllustration.value,
                                textColor: AppColors.whiteColor,
                                backgroundColor: AppColors.purpleDefaultColor,
                                informationText: "",
                                customContainer: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextWidget(
                                      controller.requestTitle.value.toUpperCase(),
                                      textColor: AppColors.whiteColor,
                                      fontSize: 18.sp,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                      child: RichTextTwoDifferentWidget(
                                        firstText: "Valor: ",
                                        firstTextColor: AppColors.whiteColor,
                                        firstTextFontWeight: FontWeight.normal,
                                        firstTextSize: 16.sp,
                                        secondText: "R\$ ${FormatNumbers.numbersToString(controller.requestValue.value)}",
                                        secondTextColor: AppColors.whiteColor,
                                        secondTextFontWeight: FontWeight.bold,
                                        secondTextSize: 16.sp,
                                        secondTextDecoration: TextDecoration.none,
                                      ),
                                    ),
                                    RichTextTwoDifferentWidget(
                                      firstText: "Data de Previs??o de Entrega: ",
                                      firstTextColor: AppColors.whiteColor,
                                      firstTextFontWeight: FontWeight.normal,
                                      firstTextSize: 16.sp,
                                      secondText: controller.deliveryDate.value,
                                      secondTextColor: AppColors.whiteColor,
                                      secondTextFontWeight: FontWeight.bold,
                                      secondTextSize: 16.sp,
                                      secondTextDecoration: TextDecoration.none,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2.h,),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextWidget(
                                        "Preencha os dados para solicita????o",
                                        textColor: AppColors.blackColor,
                                        fontSize: 18.sp,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.h, top: 2.h, right: 2.h, bottom: .5.h),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextWidget(
                                        "Tipo de Solicita????o",
                                        textColor: AppColors.blackColor,
                                        fontSize: 16.sp,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2.h,),
                                    child: Obx(
                                      () => DropdownButtonWidget(
                                        itemSelected: controller.requestSelected.value == "" ? null : controller.requestSelected.value,
                                        hintText: "Tipo de Solicita????o",
                                        height: 6.h,
                                        width: 85.w,
                                        rxListItems: controller.requestTypeList,
                                        onChanged: (selectedState) => controller.onDropdownButtonWidgetChanged(selectedState),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.h, top: 3.h, right: 2.h),
                                    child: TextFieldWidget(
                                      controller: controller.studentName,
                                      hintText: "Nome",
                                      height: 6.h,
                                      keyboardType: TextInputType.name,
                                      enableSuggestions: true,
                                      justRead: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.h, top: 3.h, right: 2.h),
                                    child: TextFieldWidget(
                                      controller: controller.raNumber,
                                      hintText: "RA",
                                      height: 6.h,
                                      keyboardType: TextInputType.number,
                                      enableSuggestions: true,
                                      justRead: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.h, top: 3.h, right: 2.h),
                                    child: TextFieldWidget(
                                      controller: controller.dateRequest,
                                      hintText: "Data do Pedido",
                                      height: 6.h,
                                      keyboardType: TextInputType.number,
                                      maskTextInputFormatter: MasksForTextFields.birthDateMask,
                                      justRead: true,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.h, top: 3.h, right: 2.h, bottom: 3.h,),
                                    child: TextFieldWidget(
                                      controller: controller.observations,
                                      height: 18.h,
                                      keyboardType: TextInputType.text,
                                      textAlignVertical: TextAlignVertical.top,
                                      maxLines: 6,
                                      decoration: InputDecoration(
                                        label: TextWidget(
                                          "Observa????o",
                                          fontSize: 16.sp,
                                          textColor: AppColors.purpleDefaultColor,
                                        ),
                                        alignLabelWithHint: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: AppColors.purpleDefaultColor,
                                            width: .25.h,
                                          ),
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: AppColors.purpleDefaultColor,
                                            width: .25.h,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color: AppColors.purpleDefaultColor,
                                            width: .25.h,
                                          ),
                                        ),
                                        contentPadding: EdgeInsets.all(1.5.h),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.h),
                              child: ButtonWidget(
                                hintText: "SOLICITAR",
                                fontWeight: FontWeight.bold,
                                widthButton: 100.w,
                                onPressed: () => controller.payRequest(),
                              ),
                            ),
                          ],
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
