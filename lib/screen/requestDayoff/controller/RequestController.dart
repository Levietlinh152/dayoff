import 'package:day_offf_app/screen/requestDayoff/model/DayOff.dart';
import 'package:day_offf_app/screen/requestDayoff/service/RequestDayOffService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestController extends GetxController{
  TextEditingController reasonController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  var selectedStartDate = DateTime.now().obs;
  var selectedEndDate = DateTime.now().obs;
  bool isMorning = false;
  bool isMultipleDay = false;

Future<void> requestDayoff() async {
  final dayoff = new DayOff(
      isMorning: isMorning,
      isMultipleDay: isMultipleDay ,
      fromDay:  DateFormat('yyyy-MM-dd').parse(selectedStartDate.value.toIso8601String()),
      toDay:  DateFormat('yyyy-MM-dd').parse(selectedEndDate.value.toIso8601String()),
      reason:  reasonController.text,
  );
  print("model:${dayoff.toDay}");
  RequestDayOffService requestDayOffService = new RequestDayOffService();
  await requestDayOffService.requestDayOff(dayoff);
}
}