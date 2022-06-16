import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        fontSize: size ?? 16,
        color: color ?? const Color(0xFF101434),
        fontWeight: weight ?? FontWeight.normal,
      ),
    );
  }
}
