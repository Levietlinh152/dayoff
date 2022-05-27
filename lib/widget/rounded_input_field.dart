import 'package:day_offf_app/widget/text_field_container.dart';
import 'package:flutter/material.dart';

import '../common/values/app_colors.dart';

class RoundedInputField extends StatelessWidget {
  final TextInputType? inputType;
  final onTap;
  final String hintText;
  final String? initValue;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController? textfielController;
  const RoundedInputField({
    Key? key,
    this.inputType,
    this.initValue,
    this.onTap,
    required this.hintText,
    this.icon = Icons.person,
    required this.onChanged,
    this.textfielController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        initialValue: initValue,
        keyboardType: inputType,
        onTap: onTap,
        controller: textfielController,
        onChanged: onChanged,
        cursorColor: AppColors.kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
