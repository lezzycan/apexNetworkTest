import 'package:apex/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouterHelper {
  RouterHelper._();

  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboardingScreen';
  static const String loginScreen = '/loginScreen';
  static const String passwordRecoveryScreen = '/passwordRecoveryScreen';
  static const String verifyIdentity = '/verifyIdentity';
  static const String createNewPassword = '/createNewPassword';
  static const String signUp = '/signUp';
  static const String otpPage = '/otpPage';
  static const String personal = '/personal';
  static const String setUpPin = '/setUpPin';
  static const String confirmation = '/confirmation';
  static const String dashboard = '/dashboard';

  static List<GetPage> routes = [
    GetPage(
        binding: SplashScreenBinding(),
        name: splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.leftToRight,
          transitionDuration: const Duration(seconds: 1),
       curve: Curves.easeInOutSine,
        ),
    GetPage(
        binding: OnBoardingScreenBinding(),
        name: onboardingScreen,
        page: () => const OnBoardingScreen(),
        transition: Transition.leftToRight,
          transitionDuration: const Duration(seconds: 1),
       curve: Curves.easeInOutSine,
        ),
    GetPage(
        binding: LoginBinding(),
        name: loginScreen,
        page: () =>  LoginScreen(),
        transition: Transition.leftToRight,
          transitionDuration: const Duration(seconds: 1),
        curve: Curves.easeInOutSine,),
    GetPage(
      binding: PasswordRecoveryBinding(),
      name: passwordRecoveryScreen,
      page: () => const PasswordRecoveryScreen(),
      transition: Transition.leftToRight,
        transitionDuration: const Duration(seconds: 1),
      children: [
        GetPage(
          name: verifyIdentity,
          page: () => VerifyIdentityScreen(),
          curve: Curves.easeInOutSine,
        ),
        GetPage(
          name: createNewPassword,
          page: () => const CreateNewPassword(),
          curve: Curves.easeInOutSine,
        )
      ],
    ),
    GetPage(
        binding: SignUpBinding(),
        name: signUp,
        page: () =>  SignUpScreen(),
        transition: Transition.leftToRight,
      curve: Curves.easeInOutSine,
          transitionDuration: const Duration(seconds: 1),
        children: [
          GetPage(
            name: otpPage,
            page: () => const OtpVerificationPage(),
           curve: Curves.easeInOutSine,
          ),
        ]),
    GetPage(
        binding: PersonalScreenBinding(),
        name: personal,
        page: () => const PersonalScreen(),
        transition: Transition.leftToRight,
        curve: Curves.easeInOutSine,
         transitionDuration: const Duration(seconds: 1),
        children: [
          GetPage(
            name: setUpPin,
            page: () => const SetPinCode(),
           curve: Curves.easeInOutSine,
          ),
          GetPage(
            name: confirmation,
            page: () => const ConfirmationPage(),
           curve: Curves.easeInOutSine,
          ),
        ]),
        GetPage(
        binding: DashBoardBinding(),
        name: dashboard,
        page: () =>  const DashBoard(),
        transition: Transition.leftToRight,
        curve: Curves.easeInOutSine,
        transitionDuration: const Duration(seconds: 1)
        ),
  ];
}
