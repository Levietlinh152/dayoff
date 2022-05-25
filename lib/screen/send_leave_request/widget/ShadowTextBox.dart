import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:flutter/material.dart';
class ShadowTextBox extends StatelessWidget {
late final Function tap;
late final String title;
late final String subtitle;
late final double w;
late final double h;

ShadowTextBox({ required this.tap, required this.title, this.subtitle='', required this.w, required this.h });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: () {
          tap();
        },
        child: Container(
          height: h,
          decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.75))
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Icon(
                    Icons.calendar_month,
                    color: Colors.redAccent,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColors.black
                    ),
                  )
                ],
              ),
               Text(
                subtitle,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                    fontSize: 20),
              )
            ],
          ),
        )
    );

  }
}
