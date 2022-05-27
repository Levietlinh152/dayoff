import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:day_offf_app/screen/requestDayoff/request_day_off_screen.dart';
import 'package:day_offf_app/screen/send_leave_request/widget/ShadowTextBox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendLeaveRequest extends StatelessWidget {
  const SendLeaveRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Send Leave Request',
          style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: AppColors.black),
          softWrap: true,
        ),
      ),
      body: Material(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height * 0.35,
              child: const Image(
                image: AssetImage('assets/images/feedbackImage.png'),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: Get.height * 0.3,
              width: Get.width * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ShadowTextBox(
                        tap: () {
                          Get.to(RequestScreenDayOff());
                        },
                        title: 'Day off',
                        subtitle: 'Request for a day off',
                        w: Get.width,
                        h: Get.height / 10),
                    ShadowTextBox(
                        tap: () {
                          Get.to(RequestScreenDayOff());
                        },
                        title: 'Comp off',
                        subtitle: 'Request for compensatory off',
                        w: Get.width,
                        h: Get.height / 10),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
