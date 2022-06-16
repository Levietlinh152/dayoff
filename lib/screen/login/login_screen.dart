
import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../widget/rounded_input_field.dart';
import '../../widget/rounded_button.dart';
import '../../widget/rounded_password_field.dart';
import '../forgot_password/forgot_password_screen.dart';
import 'widget/background.dart';

class LoginScreen extends StatelessWidget {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
       return Scaffold(
          body: Stack(
            children: [
              Background(
                child: SingleChildScrollView(
                  child: Form(
                    key: loginController.loginFormKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "LOGIN",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.amaranth),
                        ),
                        SizedBox(height: size.height * 0.03),
                        SvgPicture.asset(
                          "assets/icons/login.svg",
                          height: size.height * 0.35,
                        ),
                        SizedBox(height: size.height * 0.03),

                        RoundedInputField(
                          textfielController: loginController.usernameController,
                          hintText: "Your Email",
                          onChanged: (value) => {},
                          validator: (value){
                            return loginController.validateUsername(value!);
                          },
                        ),

                        // password here
                        RoundedPasswordField(
                          passwordController: loginController.passwordController,
                         validator: (value){
                          return loginController.validatePassword(value!);
                          },
                          onChanged: (value) => {},
                        ),
                        RoundedButton(
                          text: "LOGIN",
                          press: () async {
                            loginController.checkLogin();
                            loginController.logIn();
                          },
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const ForgotPasswordScreen();
                                  },
                                ),
                              );
                            },
                            child: const Text('Forgot Password?')),
                        SizedBox(height: size.height * 0.03),
                      ],
                    ),
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
                    icon: const Icon(
                      Icons.close,
                      size: 30,
                    )),
              )
            ],
          ),
    );
  }
}
