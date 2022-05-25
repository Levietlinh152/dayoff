import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:day_offf_app/widget/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:
      Container(
        height: Get.height/2,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundedPasswordField(
              hintText: "Enter Password",
            onChanged: (value) {},
          ),

            RoundedPasswordField(
              hintText: "New Password",
              onChanged: (value) {},
          ),
          RoundedPasswordField(
            hintText: "Conform Password",
            onChanged: (value) {},
          ),
          RoundedButton(text: "Change Password", press: (){})
        ],
        ),
      ),
    );
  }
}
