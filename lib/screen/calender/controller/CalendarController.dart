import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/date_time.dart';
import '../../all_request/model/RequestModel.dart';
import '../../all_request/service/AllRequestService.dart';
import '../untils.dart';

class CalendarController extends GetxController {
  RxList<AllRequestModel> listRequest = <AllRequestModel>[].obs;
  RxList<AllRequestModel> listRequestDay = <AllRequestModel>[].obs;

  @override
  Future<void> onInit() async {
    listRequest.value = await AllRequestDayOffService().fetchRequest();
    listRequest.value = listRequest.value.where((element) => element.state !='REJECTED').toList();
    super.onInit();
  }

  void filter(DateTime date) {
    listRequestDay.value = <AllRequestModel>[];
    for (int i = 0; i < listRequest.length; i++) {
      if (date.day -
                  (DateTimeUtilities.formatDate(listRequest[i].fromDay!)).day >=
              0 &&
          date.day -
                  (DateTimeUtilities.formatDate(listRequest[i].toDay!)).day <=
              0) {
        listRequestDay.add(listRequest[i]);
      }
    }
  }

  List<Event> listRequestForDay(DateTime dateTime) {
    List<Event> list = [];
    for (int i = 0; i < listRequest.length; i++) {
      if (dateTime.day -
                  (DateTimeUtilities.formatDate(listRequest[i].fromDay!)).day >=
              0 &&
          dateTime.day -
                  (DateTimeUtilities.formatDate(listRequest[i].toDay!)).day <=
              0) {
        list.add(Event(
            listRequest[i].reason,
            listRequest[i].reason,
            listRequest[i].reason,
            listRequest[i].reason,
            listRequest[i].reason));
      }
    }
    return list;
  }

  Color stateColor(String state) {
    if (state == "REQUESTED") {
      return Colors.orangeAccent;
    } else if (state == "APPROVED") {
      return Colors.green;
    } else
      return Colors.redAccent;
  }
}
