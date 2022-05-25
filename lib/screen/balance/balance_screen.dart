import 'package:day_offf_app/screen/balance/widget/my_tab_bar.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class BalanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Expanded(child: MyTabBar()),
      RoundedButton(
        text: 'REQUEST DAYOFF',
        textSize: 18,
        textWeight: FontWeight.w700,
        press: () {
          Get.toNamed(Routes.sendleave);
        },
      ),
    ]));
  }
}
