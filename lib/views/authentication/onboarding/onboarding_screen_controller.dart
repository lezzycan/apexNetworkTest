import 'package:apex/model/onboarding/onboardingmodel.dart';
import 'package:apex/utils/constants/apx_assets.dart';
import 'package:apex/utils/routes/app_router.dart';
import 'package:apex/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreenController extends GetxController {

  int selectedPages = 0;
static List<OnBoarding> onBoardingContents = [
  OnBoarding(image: ApxAssets.onBoardingImg1, title: "Finance app the safest and most trusted", description: "Your finance work starts here. Our here to help you track and deal with speeding up your transactions."),
    OnBoarding(image: ApxAssets.onBoardingImg2, title: "The fastest transaction process only here", description: "Get easy to pay all your bills with just a few steps. Paying your bills become fast and efficient."),
];

 String getImage(int index) {
  return onBoardingContents[index].image;
 }

 String getTitle(int index) {
  return onBoardingContents[index].title;
 }

 String getDescription(int index) {
  return onBoardingContents[index].description;
 }

 int getPagesLength(){
  return onBoardingContents.length;
 }

   final pagecontroller = PageController();

   //get controller => _controller;
 
  void updatePosition(int index) {
   
     selectedPages = index;
     update();
       
  }

   navigateToLoginScreen(){
   Get.offNamed(RouterHelper.loginScreen, );

   
    
   }
}