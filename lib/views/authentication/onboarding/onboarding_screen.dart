import 'package:apex/service/local_storage.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/extension/widget_extennsion.dart';
import 'package:apex/views/authentication/onboarding/onboarding_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ApxColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GetBuilder<OnBoardingScreenController>(
                builder: (onbCtrl) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: PageView.builder(
                    controller: onbCtrl.pagecontroller,
                    scrollBehavior: const ScrollBehavior(),
                    onPageChanged: onbCtrl.updatePosition,
                    itemCount: onbCtrl.getPagesLength(),
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: 20.h, right: 0, left: 0),
                          child: Text(
                            'Skip',
                            style: textTheme.titleLarge?.copyWith(
                              color: ApxColors.focusBorderColor,
                              fontFamily: 'SF Pro Display',
                            ),
                          ).apxTouchable(
                            () {
                               onbCtrl.navigateToLoginScreen();
                               LocalStorage.setOnboarding(true);
                            },
                          ),
                        ),
                        const ApxSpacing.bigHeight(),
                        Image.asset(
                          onbCtrl.getImage(index),
                          fit: BoxFit.cover,
                        ),
                        const ApxSpacing.bigHeight(),
                        Text(
                          onbCtrl.getTitle(index),
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium?.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const ApxSpacing.bigHeight(),
                        Text(
                          onbCtrl.getDescription(
                            index,
                          ),
                          textAlign: TextAlign.center,
                          style: textTheme.headlineMedium?.copyWith(
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: const Color(0XFF6b7280),
                          ),
                        ),
                        const ApxSpacing.bigHeight(),
                        SmoothPageIndicator(
                          controller: onbCtrl.pagecontroller,
                          count: onbCtrl.getPagesLength(),
                          effect: ExpandingDotsEffect(
                              expansionFactor: 6,
                              dotHeight: 6.h,
                              dotWidth: 6.w,
                              activeDotColor: ApxColors.buttonColor,
                              dotColor: Colors.grey),
                        ),
                        const ApxSpacing.bigHeight(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 18.w),
                          child: CustomButton(
                            onPressed: () {
                              if (onbCtrl.selectedPages ==
                                  onbCtrl.getPagesLength() - 1) {
                                onbCtrl.navigateToLoginScreen();
                                LocalStorage.setOnboarding(true);
                              } else {
                                onbCtrl.pagecontroller.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeInOutSine,
                                );
                              }
                            },
                            child: Text(
                                onbCtrl.selectedPages ==
                                        (onbCtrl.getPagesLength() - 1)
                                    ? 'Get Started'
                                    : 'Next',
                                style: textTheme.headlineMedium?.copyWith(
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w700,
                                    color: ApxColors.whiteColor,
                                    fontSize: 16.sp)),
                          ),
                        ),
                      ]);
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
