import 'package:day_offf_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common/values/styles/app_themes.dart';
import 'localization/localization_serviece.dart';
import 'screen/splash/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Day Off App',
      getPages: AppPages().funV(),
      theme: AppThemes.lightTheme,
      locale: LocalizationService.locale,
      translations: LocalizationService(),
      home: const SplashScreen(),
    );
  }
}
