import 'package:day_offf_app/screen/my_request/controller/my_request_controller.dart';
import 'package:day_offf_app/screen/pending_request/controller/pending_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import '../../common/values/app_colors.dart';
import '../../widget/rounded_button.dart';
import 'controller/RequestController.dart';

class RequestDayOff extends StatefulWidget {
  const RequestDayOff({Key? key}) : super(key: key);
  @override
  State<RequestDayOff> createState() => _RequestDayOffState();
}

class _RequestDayOffState extends State<RequestDayOff> {
  MyRequestController myRequestController = Get.find();
  final RequestController requestController = Get.put(RequestController());
  PendingRequestController pendingRequestController = Get.find();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2101),
        selectableDayPredicate: (DateTime val) =>
        val.weekday ==5 ||val.weekday==4||val.weekday==3||val.weekday==2||val.weekday==1,
        initialEntryMode: DatePickerEntryMode.calendarOnly);
    if (picked != null && picked != requestController.selectedStartDate) {
      requestController.selectedStartDate.value = picked;
      requestController.selectedEndDate.value = picked;
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        selectableDayPredicate: (DateTime val) =>
        val.weekday ==5 ||val.weekday==4||val.weekday==3||val.weekday==2||val.weekday==1,
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        initialDate: requestController.selectedStartDate.value,
        firstDate: requestController.selectedStartDate.value,
        lastDate: requestController.lastEndDate.value);

    if (picked != null && picked != requestController.selectedEndDate) {
      requestController.selectedEndDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Scaffold(
              appBar: AppBar(),
              body: ListView(
                children: <Widget>[
                  const SizedBox(height: 50),
                  SizedBox(
                      width: Get.width * 0.9,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            // DATE TIME PICKER
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  _selectStartDate(context);
                                },
                                child: Container(
                                  width: Get.width * 0.4,
                                  height: Get.height / 12,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.calendar_month,
                                            color: AppColors.clTextStatus,
                                          ),
                                          Text(
                                            'Start',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      Obx(() => Text(
                                            requestController
                                                .selectedStartDate.value
                                                .toString()
                                                .split(' ')[0],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontSize: 20),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _selectEndDate(context);
                                },
                                child: Container(
                                  width: Get.width * 0.4,
                                  height: Get.height / 12,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.calendar_month,
                                            color: AppColors.clTextStatus,
                                          ),
                                          Text(
                                            'End',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )
                                        ],
                                      ),
                                      Obx(() => Text(
                                            requestController
                                                .selectedEndDate.value
                                                .toString()
                                                .split(' ')[0],
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontSize: 20),
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RadioGroup<String>.builder(
                                direction: Axis.horizontal,
                                groupValue: requestController.groupValue.value,
                                onChanged: (value) => setState(() {
                                  requestController.groupValue.value = value!;
                                }),
                                items: requestController.status,
                                itemBuilder: (item) => RadioButtonBuilder(
                                  item,
                                  textPosition: RadioButtonTextPosition.left,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      height: Get.height / 8,
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
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: TextField(
                          controller: requestController.reasonController,
                          textAlign: TextAlign.left,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            labelText: '   Reason',
                            labelStyle: TextStyle(fontSize: 20),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: RoundedButton(
                      text: "SUBMIT",
                      press: () async {
                        requestController.requestDayoff();
                        myRequestController.onInit();
                        pendingRequestController.onInit();
                        Get.back();
                      },
                    ),
                  ),
                ],
              )),
        ),
        Obx(() {
          if (!requestController.isLoading.value) {
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
