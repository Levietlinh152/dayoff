import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  Future<void> _navigateHome() async {
    await Future<void>.delayed(const Duration(milliseconds: 1000), () {
      Get.offAllNamed(Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(child: Text("Splash screen")),
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(Assets.images.splash.path),
        //     fit: BoxFit.cover,
        //   ),
        // ),
      ),
    );
  }
}
