import 'package:day_offf_app/screen/change_password/change_password_screen.dart';
import 'package:day_offf_app/screen/employeeProfile/employeeScreen.dart';
import 'package:day_offf_app/screen/login/login_screen.dart';
import 'package:day_offf_app/screen/setting/widget/TextFuntion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          children: [
            TextFuntion(
                ontap: () => {
                  Get.to(EmployeeScreen())
                },
                lable: "Employee Profile"),
            TextFuntion(
                ontap: () {
                  Get.to(const ChangePasswordScreen());
                },
                lable: "Change Password"),
            TextFuntion(ontap: () {}, lable: "Share the app"),
            TextFuntion(ontap: () {}, lable: "Chat With Support"),
            TextFuntion(
                ontap: () {
                  Get.offAll(LoginScreen());
                },
                lable: "Log out"),
          ],
        ),
      ),
    );
  }
}
