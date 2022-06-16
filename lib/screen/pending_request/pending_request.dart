import 'package:day_offf_app/screen/pending_request/controller/pending_request_controller.dart';
import 'package:day_offf_app/screen/request_day_off/request_day_off_screen.dart';
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/values/app_colors.dart';
import '../../constants/app_url.dart';
import '../../widget/rounded_button.dart';

class PendingRequestScreen extends StatelessWidget {
  PendingRequestController controller = Get.put(PendingRequestController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        flex: 8,
        child: Center(
          child: Obx(
            () => ListView.builder(
                itemCount: controller.listPendingRequest.length,
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
                                '${controller.listPendingRequest[index].user!.nickName}',
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
                                    text: controller
                                        .listPendingRequest[index].fromDay
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
                                    text: controller
                                        .listPendingRequest[index].toDay
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
                                    'Reason : ${controller.listPendingRequest[index].reason}',
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
                                decoration: const BoxDecoration(
                                    color: Colors.orangeAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                child: CustomText(
                                  text:
                                      '  ${controller.listPendingRequest[index].state}  ',
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
                Get.to(RequestDayOff());
              })),
    ]);
  }
}
