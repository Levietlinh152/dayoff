import 'dart:ui';
import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  late var title;
  late String initValue;
  late String hint;
  final TextInputType? inputType;
  final ValueChanged<String> onChanged;
  final TextEditingController? textfieldController;

  CustomInputField(
      {required this.title,
      required this.hint,
      this.inputType,
      required this.onChanged,
      this.textfieldController,
      required this.initValue});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey[500]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: TextFormField(
            decoration: InputDecoration(
                border: const UnderlineInputBorder(),
                labelText: hint,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[400],
                    fontSize: 10)),
            controller: textfieldController,
            initialValue: initValue,
          ),
        ),
      ],
    ));
  }
}
