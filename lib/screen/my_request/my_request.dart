import 'package:day_offf_app/screen/my_request/controller/my_request_controller.dart';
import 'package:day_offf_app/screen/request_day_off/request_day_off_screen.dart';
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/values/app_colors.dart';
import '../../constants/app_url.dart';

class MyRequestScreen extends StatefulWidget {
  @override
  State<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends State<MyRequestScreen> {
  MyRequestController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 8,
        child: Center(
          child: Obx(
            () => ListView.builder(
                itemCount: controller.myRequest.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      margin: const EdgeInsets.all(10),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: AppColors.border),
                          ),
                        ),
                        child: ListTile(
                          leading: const CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(AppUrl.avatar_url),
                          ),
                          title: CustomText(
                            text:
                                '${controller.myRequest[index].user!.nickName}',
                            size: 20,
                            color: AppColors.black,
                            weight: FontWeight.bold,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 15,
                                  ),
                                  CustomText(
                                    text: controller.myRequest[index].fromDay
                                        .toString()
                                        .substring(0, 10),
                                    size: 15,
                                    color: AppColors.doveGray,
                                    weight: FontWeight.w500,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today_outlined,
                                    size: 15,
                                  ),
                                  CustomText(
                                    text: controller.myRequest[index].toDay
                                        .toString()
                                        .substring(0, 10),
                                    size: 15,
                                    color: AppColors.doveGray,
                                    weight: FontWeight.w500,
                                  )
                                ],
                              ),
                              CustomText(
                                text:
                                    'Reason : ${controller.myRequest[index].reason}',
                                size: 15,
                                color: AppColors.amaranth,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                          isThreeLine: true,
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: controller.stateColor(
                                        controller.myRequest[index].state!),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: CustomText(
                                  text:
                                      '  ${controller.myRequest[index].state}  ',
                                  size: 15,
                                  color: AppColors.white,
                                  weight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                }),
          ),
        ),
      ),
      Expanded(
          flex: 1,
          child: RoundedButton(
              text: "Request leave",
              press: () {
                Get.to(const RequestDayOff());
              })),
    ]);
  }
}
