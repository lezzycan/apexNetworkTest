import 'package:apex/core/bindings/bindings.dart';
import 'package:apex/utils/common/dumb_widget/apx_spacing.dart';
import 'package:apex/utils/common/smart_widgets/apx_custom_button.dart';
import 'package:apex/utils/constants/apx_colors.dart';
import 'package:apex/utils/extension/widget_extennsion.dart';
import 'package:apex/utils/routes/app_router.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:scratcher/widgets.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  ConfettiController confController = ConfettiController();

  @override
  void initState() {
    confController = ConfettiController(
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        centerTitle: true,
        elevation: 1,
       automaticallyImplyLeading: false,
       leading: GestureDetector(onTap: (){
        Get.back(closeOverlays: true);
        
       },
       child: Icon(Icons.west),
       ),
        
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: GetBuilder<DashBoardController>(builder: (dashCtrl) {
          if (dashCtrl.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dashCtrl.reveal == true
                    ? const SizedBox.shrink()
                    : Text('Scratch to reveal secret',
                        style: textTheme.bodyLarge?.copyWith(
                            color: ApxColors.errorColor,
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w700)),
                ApxSpacing.height(20.h),
                Scratcher(
                  brushSize: 50,
                  threshold: 75,
                  color: ApxColors.errorColor,
                  image: Image.asset(
                    "assets/images/jpg/confectti.jpg",
                    fit: BoxFit.fill,
                  ),
                  onChange: (val) {
                    dashCtrl.reveal = true;
                    dashCtrl.update();
                  },
                  onThreshold: () => confController.play(),
                  child: GestureDetector(
                    onTap: () {
                      dashCtrl.reveal = true;
                      dashCtrl.update();
                    },
                    child: Container(
                        width: double.infinity,
                        height: 110.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ApxColors.whiteColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ConfettiWidget(
                              confettiController: confController,
                              blastDirectionality:
                                  BlastDirectionality.explosive,
                              particleDrag: 0.05,
                              emissionFrequency: 0.05,
                              numberOfParticles: 100,
                              gravity: 0.05,
                              shouldLoop: false,
                              colors: const [
                                Colors.green,
                                Colors.yellow,
                                Colors.red,
                                Colors.orange
                              ],
                            ),
                            Center(
                              child: Text(
                                '${dashCtrl.dashBoardRes?.data?.secret}',
                                textAlign: TextAlign.center,
                                style: textTheme.bodyLarge?.copyWith(
                                    color: ApxColors.primaryColor,
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            );
          }
        }),
      )),
    );
  }
}
