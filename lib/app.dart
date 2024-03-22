import 'package:apex/service/local_storage.dart';
import 'package:apex/utils/routes/app_router.dart';
import 'package:apex/utils/theme/apx_theming.dart';
import 'package:country_picker/country_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ApxApp extends StatelessWidget {
  const ApxApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      title: 'Smart Pay',
      theme: ApxThemeManager.lightTheme,
      initialRoute:LocalStorage.getOnboarding() == true ? RouterHelper.loginScreen : RouterHelper.splashScreen,
       getPages: RouterHelper.routes,
     debugShowCheckedModeBanner: false,
     supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('es'),
        Locale('de'),
        Locale('fr'),
        Locale('el'),
        Locale('et'),
        Locale('nb'),
        Locale('nn'),
        Locale('pl'),
        Locale('pt'),
        Locale('ru'),
        Locale('hi'),
        Locale('ne'),
        Locale('uk'),
        Locale('hr'),
        Locale('tr'),
        Locale('lv'),
        Locale('lt'),
        Locale('ku'),
        Locale('nl'),
        Locale('it'),
        Locale('ko'),
        Locale('ja'),
        Locale('id'),
        Locale('cs'),
        Locale('ht'),
        Locale('sk'),
        Locale('ro'),
        Locale('bg'),
        Locale('ca'),
        Locale('he'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
      ],
      localizationsDelegates: const [
        CountryLocalizations.delegate,
        // GlobalMaterialLocalizations.delegate,
        // GlobalCupertinoLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
 }
  void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 4000)
    ..indicatorType = EasyLoadingIndicatorType.wanderingCubes
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45
    ..radius = 10
    ..progressColor = Colors.deepOrange
    ..backgroundColor = Colors.transparent
    ..indicatorColor = Colors.deepOrange
    ..textColor = Colors.deepOrange
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}
