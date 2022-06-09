import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color kPrimaryColor = Color(0xFF6F35A5);
  static const Color mineShaft = Color(0xFF2B2B2B);
  static const Color doveGray = Color(0xFF646464);
  static const Color caribbeanGreen = Color(0xFF06C5AC);
  static const Color amaranth = Color(0xFFea435d);
  static const Color success = Color(0xFF31B01D);
  static const Color borderInput = Color(0xFFE6EBF2);
  static const Color backgroundInput = Color(0xFFFAFAFC);
  static const Color backgroundItemWheel_1 = Color(0xFF2E89FF);
  static const Color backgroundItemWheel_2 = Color(0xFFFCFCFB);
  static const Color pink10 = Color(0x1AE36386);
  static const Color black = Color(0xFF101434);
  static const Color white = Colors.white;
  static const Color blue = Color(0xFF007AFF);
  static const Color colorTextDashboard = Color(0xFFE36386);
  static const Color bgCancelCoupon = Color(0xFFAEB2BD);
  static const Color clTextStatus = Color(0xFFFF9500);
  static const Color clBlack = Color(0xFF000000);
  static const error = Color(0xffF73535);
  static const focusedBorder = Color(0xff4A52BF);
  static const border = Color(0xffD3D9DC);
  static const focusedText = Color(0xff4A52BF);
  static const placeholderText = Color(0xff455465);
  static const kPrimaryLightColor = Color(0xFFF1E6FF);
  static LinearGradient getLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        color[300]!,
        color[200]!,
        color[100]!,
      ],
      stops: const [
        0.4,
        0.7,
        0.9,
      ],
    );
  }
}
