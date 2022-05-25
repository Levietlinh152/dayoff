import 'package:day_offf_app/constants/app_url.dart';
import 'package:day_offf_app/screen/Holiday/Holiday.dart';
import 'package:day_offf_app/screen/all_request/AllRequestScreen.dart';
import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/screen/all_request/service/AllRequestService.dart';
import 'package:day_offf_app/screen/all_user/AllUserScreen.dart';
import 'package:day_offf_app/screen/all_user/service/AllService.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class ProfileScreen extends StatelessWidget {
  AllService allService = new AllService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      width: Get.width,
      height: Get.height,
      child: Container(
        height: Get.height * 0.75,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Column(
            children: const [
              CircleAvatar(
                backgroundImage: NetworkImage(AppUrl.avatar_url),
                radius: 100,
              ),
              Text(
                "Linh",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text(
                    'Holiday',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Get.to(HolidayScreen());
                    },
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.calendar_month_sharp,
                      color: Colors.lightBlue[900],
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  )
                ],
              ),
              Column(
                children: [
                  const Text(
                    'Setting',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Get.toNamed(Routes.setting);
                    },
                    elevation: 2.0,
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.settings,
                      size: 35.0,
                      color: Colors.lightBlue[900],
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: const CircleBorder(),
                  )
                ],
              )
            ],
          ),
          const Text(
            'Share the app',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
            child: RoundedButton(
              text: "All user",
              textSize: 20,
              press: () {
                Get.to(AllScreen());
                AllService().fetchPost();
              },
            ),
          ),
          Container(
            child: RoundedButton(
              text: "All request",
              textSize: 20,
              press: () {
                Get.to(AllRequest());
                // Get.to(AllRequestScreen());

              },
            ),
          )
        ]),
      ),
    ));
  }
}
