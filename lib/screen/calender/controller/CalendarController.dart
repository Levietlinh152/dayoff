import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:get/get.dart';

import '../../../constants/date_time.dart';
import '../../all_request/model/RequestModel.dart';
import '../../all_request/service/AllRequestService.dart';

class CalendarController extends GetxController {
  RxList<AllRequestModel> listRequest = <AllRequestModel>[].obs;
  RxList<AllRequestModel> listRequestDay = <AllRequestModel>[].obs;

  @override
  Future<void> onInit() async {
    listRequest.value = await AllRequestDayOffService().fetchRequest();
    super.onInit();
  }

  // bool chooseDay(DateTime date){
  //
  // }

  void filter(DateTime date) {
    listRequestDay.value = <AllRequestModel>[];
    for (int i = 0; i < listRequest.length; i++) {

      if(date.difference(DateTimeUtilities.formatDate(listRequest[i].fromDay!)).inDays>=0
      && date.difference(DateTimeUtilities.formatDate(listRequest[i].toDay!)).inDays<=0){
        // int daysBetween(DateTime from, DateTime to) {
        //   from = DateTime(from.year, from.month, from.day);
        //   to = DateTime(to.year, to.month, to.day);
        //   return (to.difference(from).inHours / 24).round();
        // }
        // print(daysBetween(date,DateTimeUtilities.formatDate(listRequest[i].fromDay!)));
        // print(daysBetween(DateTimeUtilities.formatDate(listRequest[i].fromDay!),date));
        listRequestDay.add(listRequest[i]);
      }
      // if (date.day -
      //             DateTimeUtilities.formatDate(listRequest[i].fromDay!).day >=
      //         0 &&
      //     DateTimeUtilities.formatDate(listRequest[i].toDay!).day -
      //             date.day >=
      //         0) {
      //   listRequestDay.add(listRequest[i]);
      // }
    }
  }
}
