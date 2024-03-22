import 'package:apex/core/bindings/bindings.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/constants/apx_assets.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(child: GetBuilder<SplashScreenController>(
       // init: SplashScreenController(),
       
        builder:(splCtrl) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
          
            children: [
              SvgPicture.asset(ApxAssets.apxLogo),
             const ApxSpacing.height(18),
             Text.rich(TextSpan(
              text: 'Smart',
              style:textTheme.headlineLarge?.copyWith(fontFamily: 'SF Pro Display', fontWeight: FontWeight.w700) ,
              children: [
                TextSpan(
                  text: 'pay.',
                   style:textTheme.headlineLarge?.copyWith(fontFamily: 'SF Pro Display', color:ApxColors.primaryColor ) ,
                )
              ]
             ))
            ],
          ),
        ),
      )),
    );
  }
}