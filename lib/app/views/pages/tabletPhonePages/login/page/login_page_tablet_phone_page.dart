import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/helpers/text_field_validators.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/app_close_controller.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/paths.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../forgotInformations/page/forgot_information_tablet_phone_page.dart';
import '../controller/login_page_tablet_phone_controller.dart';
import '../../../../stylePages/app_colors.dart';

class LoginPageTabletPhone extends StatefulWidget {
  const LoginPageTabletPhone({Key? key}) : super(key: key);

  @override
  State<LoginPageTabletPhone> createState() => _LoginPageTabletPhoneState();
}

class _LoginPageTabletPhoneState extends State<LoginPageTabletPhone> {
  late LoginTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(LoginTabletPhoneController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return AppCloseController.verifyCloseScreen();
      },
      child: SafeArea(
        child: Material(
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
                SvgPicture.asset(
                  Paths.Ilustracao_Topo,
                  width: 30.w,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    Paths.Ilustracao_Rodape,
                    height: 14.h,
                  ),
                ),
                Scaffold(
                  backgroundColor: AppColors.transparentColor,
                  body: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: SvgPicture.asset(
                              Paths.Logo_Login,
                              width: 45.w,
                            ),
                          ),
                          Expanded(
                            child: Form(
                              key: controller.formKey,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5.w, top: 5.h, right: 5.w),
                                    child: TextWidget(
                                      "O aplicativo oficial para os estudantes terem acesso a todos os conte??dos acad??mico.",
                                      textColor: AppColors.purpleDefaultColor,
                                      fontSize: 17.sp,
                                      textAlign: TextAlign.center,
                                      maxLines: 4,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.h),
                                    child: Obx(
                                      () => TextFieldWidget(
                                        controller: controller.raInputController,
                                        hintText: "RA",
                                        height: 7.h,
                                        width: 75.w,
                                        hasError: controller.raInputHasError.value,
                                        validator: (String? value) {
                                          String? validation = TextFieldValidators.standardValidation(value, "Informe o RA");
                                          if(validation != null && validation != ""){
                                            controller.raInputHasError.value = true;
                                          }
                                          else{
                                            controller.raInputHasError.value = false;
                                          }
                                          return validation;
                                        },
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButtonWidget(
                                      hintText: "Esqueceu o RA?",
                                      fontSize: 16.sp,
                                      onTap: () => Get.to(() => ForgotInformationTabletPhonePage(information: forgotInformation.ra,)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 1.5.h),
                                    child: Obx(
                                      () => TextFieldWidget(
                                        controller: controller.passwordInputController,
                                        hintText: "Digite sua senha",
                                        height: 7.h,
                                        width: 75.w,
                                        isPassword: controller.passwordFieldEnabled.value,
                                        hasError: controller.passwordInputHasError.value,
                                        validator: (String? value) {
                                          String? validation = TextFieldValidators.passwordValidation(value);
                                          if(validation != null && validation != ""){
                                            controller.passwordInputHasError.value = true;
                                          }
                                          else{
                                            controller.passwordInputHasError.value = false;
                                          }
                                          return validation;
                                        },
                                        iconTextField: GestureDetector(
                                          onTap: () {
                                            controller.passwordFieldEnabled.value =
                                            !controller.passwordFieldEnabled.value;
                                          },
                                          child: Icon(
                                            controller.passwordFieldEnabled.value
                                                ? Icons.visibility_off
                                                : Icons.visibility,
                                            color: AppColors.purpleDefaultColor,
                                            size: 2.5.h,
                                          ),
                                        ),
                                        keyboardType: TextInputType.visiblePassword,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButtonWidget(
                                      hintText: "Esqueceu a Senha?",
                                      fontSize: 16.sp,
                                      onTap: () => Get.to(() => ForgotInformationTabletPhonePage(information: forgotInformation.password,)),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: ButtonWidget(
                                      hintText: "LOGAR",
                                      fontWeight: FontWeight.bold,
                                      widthButton: 75.w,
                                      onPressed: () => controller.loginPressed(),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.h),
                                    child: TextButtonWidget(
                                      onTap: () => controller.createAccount(),
                                      richText: RichTextTwoDifferentWidget(
                                        firstText: "N??o tem Cadastro? ",
                                        secondText: "Clique Aqui!",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                controller.loadingTabletPhoneWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}