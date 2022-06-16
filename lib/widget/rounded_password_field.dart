import 'package:day_offf_app/widget/controller/PasswordController.dart';
import 'package:day_offf_app/widget/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/values/app_colors.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;
  final TextEditingController? passwordController;
  final  FormFieldValidator<String>? validator;


  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
    this.hintText,
    this.passwordController,
    this.validator
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PasswordController c = Get.put(PasswordController());

    return TextFieldContainer(
        child: Obx(
      () => TextFormField(
        controller: passwordController,
        obscureText: c.obscureText.value,
        onChanged: onChanged,
        cursorColor: AppColors.kPrimaryColor,
        validator: validator ,
        decoration: InputDecoration(
          hintText: hintText ?? "Password",
          icon: const Icon(
            Icons.lock,
            color: AppColors.kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
              onTap: () {
                c.onChange();
              },
              child: const Icon(
                Icons.visibility,
                color: AppColors.kPrimaryColor,
              )),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    ));
  }
}
