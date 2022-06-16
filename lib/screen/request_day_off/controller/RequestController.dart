import 'package:day_offf_app/screen/my_request/controller/my_request_controller.dart';
import 'package:day_offf_app/screen/pending_request/controller/pending_request_controller.dart';
import 'package:day_offf_app/screen/request_day_off/service/RequestDayOffService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/DayOff.dart';

class RequestController extends GetxController {
  TextEditingController reasonController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  MyRequestController myRequestController = Get.find();
  PendingRequestController pendingRequestController = Get.find();

  final List<String> status = ["Morning", "Multi Day", "Afternoon"];

  var initStartDate = DateTime.now().obs;
  var firstStartDate = DateTime.now().obs;

  var firstEndDate = DateTime.now().obs;
  var lastEndDate = DateTime(2030).obs;

  var selectedStartDate = DateTime.now().obs;
  var selectedEndDate = DateTime.now().obs;

  bool isMorning = false;
  bool isMultipleDay = false;
  bool isAfternoon = false;

  RxString groupValue = "".obs;
  RxBool isLoading = false.obs;

  void checkDay() {
    if (groupValue == "Morning") {
      isMorning = true;
    } else if (groupValue == "Multi Day") {
      isMultipleDay = true;
    } else if (groupValue == "Afternoon") {
      isAfternoon = true;
    }
  }

  Future<void> requestDayoff() async {
    isLoading.value = true;
    checkDay();
    final dayoff = DayOff(
      isAfternoon: isAfternoon,
      isMorning: isMorning,
      isMultipleDay: isMultipleDay,
      fromDay: DateFormat('yyyy-MM-dd')
          .parse(selectedStartDate.value.toIso8601String()),
      toDay: DateFormat('yyyy-MM-dd')
          .parse(selectedEndDate.value.toIso8601String()),
      reason: reasonController.text,
    );
    await RequestDayOffService().requestDayOff(dayoff);
    isLoading.value = false;
    myRequestController.onInit();
    pendingRequestController.onInit();
  }
}
