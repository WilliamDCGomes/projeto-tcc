import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/widgetsShared/text_button_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../requestRegistrationCancellation/page/request_registration_cancellation_tablet_phone_page.dart';
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/user_profile_tablet_phone_controller.dart';

class UserProfileTablePhonePage extends StatefulWidget {
  const UserProfileTablePhonePage({Key? key}) : super(key: key);

  @override
  State<UserProfileTablePhonePage> createState() => _UserProfileTablePhonePageState();
}

class _UserProfileTablePhonePageState extends State<UserProfileTablePhonePage> with SingleTickerProviderStateMixin{
  late UserProfileTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(UserProfileTabletPhoneController(), tag: 'user-profile-tablet-phone-controller');
    controller.tabController = TabController(
      length: 4,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Container(
          height: double.infinity,
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
              Scaffold(
                backgroundColor: AppColors.transparentColor,
                body: Padding(
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TitleWithBackButtonTabletPhoneWidget(
                                title: "Perfil",
                              ),
                            ),
                            SvgPicture.asset(
                              Paths.Logo_Pce_Home,
                              width: 15.w,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 14.h,
                        width: 14.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.h),
                          color: AppColors.purpleDefaultColor,
                        ),
                        child: Obx(
                              () => controller.hasPicture.value ?
                          Image.asset(
                              ""
                          ) :
                          Center(
                            child: TextWidget(
                              controller.nameInitials,
                              textColor: AppColors.backgroundColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 26.sp,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h, bottom: .5.h),
                        child: Obx(
                          () => TextWidget(
                            "Ol??, ${controller.userName.value}!",
                            textColor: AppColors.blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 3.h),
                        child: TextWidget(
                          controller.disciplineName,
                          textColor: AppColors.blackColor,
                          fontSize: 17.sp,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: controller.tabController,
                          children: controller.tabsList,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Obx(
                              () => ButtonWidget(
                            hintText: controller.buttonText.value,
                            fontWeight: FontWeight.bold,
                            widthButton: double.infinity,
                            borderColor: controller.profileIsDisabled.value ? AppColors.orangeColor : AppColors.purpleDefaultColor,
                            backgroundColor: controller.profileIsDisabled.value ? AppColors.orangeColor : AppColors.purpleDefaultColor,
                            onPressed: () => controller.editButtonPressed(),
                          ),
                        ),
                      ),
                      TextButtonWidget(
                        onTap: () => Get.to(() => RequestRegistrationCancellationTabletPhonePage()),
                        widgetCustom: TextWidget(
                          "Solicitar cancelamento de matr??cula",
                          textColor: AppColors.purpleDefaultColor,
                          fontSize: 17.sp,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          textDecoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  height: 9.h,
                  padding: EdgeInsets.fromLTRB(.5.h, 0, .5.h, .5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4.5.h),
                      topLeft: Radius.circular(4.5.h),
                    ),
                    color: AppColors.backgroundColor,
                  ),
                  child: TabBar(
                    controller: controller.tabController,
                    indicatorColor: AppColors.purpleDefaultColor,
                    indicatorWeight: .3.h,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    labelColor: AppColors.purpleTabColor,
                    unselectedLabelColor: AppColors.grayTabColor,
                    tabs: [
                      Tab(
                        text: "Perfil",
                        icon: ImageIcon(
                          AssetImage(Paths.Icone_Perfil),
                          size: 4.h,
                        ),
                        height: 9.h,
                      ),
                      Tab(
                        text: "Endere??o",
                        icon: ImageIcon(
                          AssetImage(Paths.Icone_Endereco),
                          size: 4.h,
                        ),
                        height: 9.h,
                      ),
                      Tab(
                        text: "Contato",
                        icon: ImageIcon(
                          AssetImage(Paths.Icone_Contato),
                          size: 4.h,
                        ),
                        height: 9.h,
                      ),
                      Tab(
                        text: "Acad??mico",
                        icon: ImageIcon(
                          AssetImage(Paths.Icone_Academico),
                          size: 4.h,
                        ),
                        height: 9.h,
                      ),
                    ],
                  ),
                ),
              ),
              controller.loadingWithSuccessOrErrorTabletPhoneWidget,
            ],
          ),
        ),
      ),
    );
  }
}
