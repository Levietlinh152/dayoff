import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/screen/balance_tab/controller/BalanceTabController.dart';
import 'package:day_offf_app/screen/balance_tab/widget/my_chart.dart';
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BalanceTabScreen extends StatelessWidget {
  BalanceTabController controller = Get.put(BalanceTabController());
  AllRequestController allRequestController = Get.put(AllRequestController());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: Get.height * 0.8,
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), //
                        color: Colors.white),
                    height: Get.height / 14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text('This year',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 20,
                            )),
                        Container(
                          alignment: Alignment.centerRight,
                          child: const Icon(Icons.calendar_month),
                        )
                      ],
                    )),
                Stack(
                  children: <Widget>[
                    Container(
                        width: Get.width,
                        height: Get.height * 0.3,
                        decoration: const BoxDecoration(color: Colors.white)),
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Container(
                        width: Get.width * 0.5,
                        height: Get.height * 0.25,
                        alignment: Alignment.centerLeft,
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
                      ),
                    ),
                    Positioned(
                        top: 40,
                        left: 40,
                        child: Column(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                width: Get.height / 5,
                                height: Get.height / 5,
                                child: MyChart()),
                            const Text(
                              'Schedule',
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
            const Text(
              'PENDING',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: Get.width,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                  children: List.generate(
                      allRequestController.listPendingRequest.value.length,
                      (index) {
                return Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    )),
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '1 Day off',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: AppColors.clBlack),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 13,
                                ),
                                Text(
                                  allRequestController
                                      .listPendingRequest[index].fromDay
                                      .toString()
                                      .substring(0, 10),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 13,
                                ),
                                Text(
                                  allRequestController
                                      .listPendingRequest[index].toDay
                                      .toString()
                                      .substring(0, 10),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.amaranth,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: Text(
                                '   ${allRequestController.listPendingRequest[index].state}   ',
                                style: const TextStyle(
                                    color: AppColors.white, fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(Icons.delete_outline,
                              size: 30, color: AppColors.amaranth),
                        )
                      ],
                    ));
              })),
            ),
            const Text(
              'HISTORY',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
              width: Get.width,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                  children: List.generate(
                      // ignore: invalid_use_of_protected_member
                      allRequestController.listApprovedRequest.value.length,
                      (index) {
                return Container(
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    )),
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CustomText(
                              text: '1 Day off',
                              size: 20,
                              color: AppColors.clBlack,
                              weight: FontWeight.bold,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 13,
                                ),
                                CustomText(
                                  text: allRequestController
                                      .listApprovedRequest[index].fromDay
                                      .toString()
                                      .substring(0, 10),
                                  size: 13,
                                  color: AppColors.clBlack,
                                  weight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  size: 13,
                                ),
                                Text(
                                  allRequestController
                                      .listApprovedRequest[index].toDay
                                      .toString()
                                      .substring(0, 10),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Accepted',
                                style: TextStyle(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                )),
                            Container(
                              decoration: const BoxDecoration(
                                  color: AppColors.success,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: CustomText(
                                text:
                                    '   ${allRequestController.listApprovedRequest[index].state}   ',
                                size: 16,
                                color: AppColors.white,
                                weight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ));
              })),
            ),
          ],
        ),
      ),
    );
  }
}
