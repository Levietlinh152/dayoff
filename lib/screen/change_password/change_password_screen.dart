import 'package:day_offf_app/screen/change_password/controller/change_password_controller.dart';
import 'package:day_offf_app/screen/change_password/model/UpdatePasswordModel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:day_offf_app/widget/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {

ChangePasswordController controller = Get.put(ChangePasswordController());
LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const CustomText(text: "Change your password",color: Colors.white,),),
      body: Container(
        height: Get.height/2,
        alignment: Alignment.center,
        child: Form(
          key: controller.changePasswordKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedPasswordField(
                passwordController: controller.newPassword,
                hintText: "New Password",
                onChanged: (value) {},
                validator: (value){
                  return controller.validatePassword(value!);
                },
              ),
              RoundedPasswordField(
                passwordController: controller.confirmPassword,
                hintText: "Confirm New Password",
                onChanged: (value) {},
                validator: (value){
                  return controller.validateConfirmPassword(value!);
                },
              ),
              RoundedButton(text: "Change Password", press: () {
                if(controller.changePasswordKey.currentState!.validate()) {
                  UpdatePasswordModel updatePassword = UpdatePasswordModel(
                      password: controller.newPassword.text
                  );
                  controller.updatePassword(
                      loginController.user_id.value, updatePassword);
                }
                })
            ],
          ),
        ),
      ),
    );
  }
}
