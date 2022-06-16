import 'package:day_offf_app/screen/all_request/DetailRequest.dart';
import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/values/app_colors.dart';
import '../../constants/app_url.dart';
import 'service/AllRequestService.dart';

class AllRequest extends StatefulWidget {
  @override
  State<AllRequest> createState() => _AllRequestState();
}

class _AllRequestState extends State<AllRequest> {
  AllRequestController allRequestController = Get.find();
  @override
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('List Request'),
          ),
          body: Center(
            child: Obx(
              () => ListView.builder(
                  itemCount: allRequestController.listRequest.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        margin: const EdgeInsets.all(10),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 1.0, color: AppColors.border),
                            ),
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.to(DetailRequest(
                                  request:
                                      allRequestController.listRequest[index]));
                            },
                            child: ListTile(
                              leading: const CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    NetworkImage(AppUrl.avatar_url),
                              ),
                              title: CustomText(
                                text:
                                    '${allRequestController.listRequest[index].user!.nickName}',
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
                                        text: allRequestController
                                            .listRequest[index].fromDay
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
                                        text: allRequestController
                                            .listRequest[index].toDay
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
                                        'Reason : ${allRequestController.listRequest[index].reason}',
                                    size: 15,
                                    color: AppColors.amaranth,
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: allRequestController.stateColor(
                                            allRequestController
                                                .listRequest[index].state!),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8))),
                                    child: CustomText(
                                      text:
                                          '  ${allRequestController.listRequest[index].state}  ',
                                      size: 15,
                                      color: AppColors.white,
                                      weight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  }),
            ),
          ),
        ),
        Obx(() {
          if (!allRequestController.isLoading.value) {
            return Container();
          }
          return const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColors.kPrimaryColor,
                color: AppColors.white,
              ),
            ),
          );
        }),
      ],
    );
  }
}
