import 'package:day_offf_app/widget/controller/PasswordController.dart';
import 'package:day_offf_app/widget/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/values/app_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;
  final TextEditingController? passwordController;


  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.hintText,
    this.passwordController,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PasswordControler c = Get.put(PasswordControler());

    return TextFieldContainer(
      child: Obx(()=> TextField(
        controller: passwordController,
        obscureText: c.obscureText.value,
        onChanged: onChanged,
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
          hintText:hintText?? "Password",
          icon: Icon(
            Icons.lock,
            color: AppColors.kPrimaryColor,
          ),
          suffixIcon: new GestureDetector(
            onTap: (){c.onChange();},
          child : Icon(
            Icons.visibility,
            color: AppColors.kPrimaryColor,

        )
        ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
      ),

    ),
    )
    );
  }
}
