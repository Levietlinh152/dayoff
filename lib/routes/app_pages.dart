import 'package:day_offf_app/screen/main/main_screen.dart';
import 'package:day_offf_app/screen/setting/setting_screen.dart';
import 'package:get/get.dart';

import '../screen/forgot_password/forgot_password_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/login/login_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages();

  List<GetPage<dynamic>> funV() {
    return pages;
  }

  final List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage<dynamic>(
      name: Routes.home,
      page: () => const HomeScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.main,
      page: () => const MainScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.login,
      page: () => LoginScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.forgot_password,
      page: () => const ForgotPasswordScreen(),
    ),
    GetPage<dynamic>(
      name: Routes.setting,
      page: () => const SettingScreen(),
    ),
  ];
}
