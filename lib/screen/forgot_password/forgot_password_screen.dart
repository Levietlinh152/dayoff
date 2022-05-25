import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../widget/rounded_input_field.dart';
import '../../widget/rounded_button.dart';
import 'widget/background.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Background(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.kPrimaryColor),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/signup.svg",
                    height: size.height * 0.3,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "userName".tr.toUpperCase(),
                    onChanged: (value) {},
                  ),
                  RoundedButton(
                    text: "Send",
                    press: () {},
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  size: 30,
                )),
          )
        ],
      ),
    );
  }
}
