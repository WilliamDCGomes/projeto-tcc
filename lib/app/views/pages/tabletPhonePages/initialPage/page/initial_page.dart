import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/helpers/platform_type.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/app_close_controller.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../controller/initial_page_controller.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late InitialPageController controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      controller = Get.put(InitialPageController());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return AppCloseController.verifyCloseScreen();
      },
      child: SafeArea(
        child: Material(
          child: Stack(
            children: [
              Image.asset(
                Paths.background,
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
                cacheHeight: 700,
                cacheWidth: 700,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: Image.asset(
                        Paths.logo_pce,
                        height: PlatformType.isPhone(context) ? 18.h : 12.h,
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                      width: 6.h,
                      child: CircularProgressIndicator(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}