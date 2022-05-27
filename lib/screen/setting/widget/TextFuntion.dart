import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFuntion extends StatelessWidget {
  late final Function ontap;
  late final String lable;

  TextFuntion({required this.ontap, required this.lable});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {ontap()},
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: AppColors.border),
            ),
          ),
          alignment: Alignment.centerLeft,
          height: Get.height / 14,
          child: Text(lable,
              style: const TextStyle(fontSize: 20.0, color: Colors.black),
              textAlign: TextAlign.start),
        ));
  }
}
