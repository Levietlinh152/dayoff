import 'package:day_offf_app/routes/app_pages.dart';
import 'package:day_offf_app/screen/sign_up/controller/SignUpController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../common/values/app_colors.dart';
import '../../widget/custom_text.dart';
import '../../widget/rounded_button.dart';
import '../../widget/rounded_input_field.dart';
import '../../widget/rounded_password_field.dart';
import '../forgot_password/widget/background.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        Background(
            child: SingleChildScrollView(
              child: Form(
               key: signUpController.signUpKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.03),
                    Text(
                      "signup".tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.kPrimaryColor),
                    ),
                    SizedBox(height: size.height * 0.03),

                    RoundedInputField(
                      textfielController: signUpController.fullnameController,
                      icon: Icons.home_repair_service,
                      hintText: "Full Name",
                      onChanged: (value) {},
                      validator: (value){
                        return signUpController.validateFullname(value!);
                      },
                    ),

                    RoundedInputField(
                      textfielController: signUpController.nicknameController,
                      hintText: "Nick Name",
                      onChanged: (value) {},
                      ),

                    RoundedInputField(
                      textfielController: signUpController.emailController,
                      hintText: "email",
                      icon: Icons.email,
                      onChanged: (value) => {},
                      validator: (value)  {
                     return signUpController.validateEmail(value!);
                        }
                    ),

                    RoundedInputField(
                      textfielController: signUpController.citizenIdController,
                      hintText: "CityzenID",
                      icon: Icons.location_city,
                      onChanged: (value) => {},

                    ),

                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: size.width * 0.8,
                      decoration: const  BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.leak_add,
                            color: AppColors.kPrimaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: DropdownButton<String>(
                              value: signUpController.levelValue,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  signUpController.levelValue = newValue!;
                                });
                              },
                              items: <String>[
                                'INTERN',
                                'FRESHER',
                                'JUNIOR',
                                'MIDDLE',
                                'SENIOR',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //get date
                    RoundedInputField(
                      textfielController: signUpController.dateController,
                      onTap: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1900, 3, 5),
                            maxTime: DateTime.now(), onChanged: (date) {
                        }, onConfirm: (date) {
                          signUpController.dateController.text =
                              date.toString().substring(0, 10);
                        }, currentTime: DateTime.now(), locale: LocaleType.vi);
                      },
                      hintText: "date of birth",
                      icon: Icons.house_siding_rounded,
                      onChanged: (value) {},
                    ),

                    RoundedInputField(
                      textfielController: signUpController.usernameController,
                      hintText: "username",
                      icon: Icons.people,
                      onChanged: (value) {
                      },
                    ),

                    RoundedPasswordField(
                      passwordController: signUpController.passwordController,
                      onChanged: (value) => {},
                      validator: (value){
                       return signUpController.validatePassword(value!);
                      },
                    ),

                    RoundedPasswordField(
                      passwordController:
                          signUpController.confirmPasswordController,
                      hintText: 'confirmPassword'.tr,
                      onChanged: (value)=> {},
                    ),

                    RoundedButton(
                      text: "Send",
                      press: () async {
                        if (signUpController.signUpKey.currentState!.validate()) {
                          signUpController.signUp();
                        }
                      }
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(text: 'Already have an account!'),
                        TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.login);
                            },
                            child: const Text('Sign in'))
                      ],
                    ),
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
    ));
  }
}
