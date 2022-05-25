import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:get/get.dart';

import '../../../constants/date_time.dart';
import '../../all_request/model/RequestModel.dart';
import '../../all_request/service/AllRequestService.dart';

class CalendarController extends GetxController{
  RxList<AllRequestModel> listRequest = <AllRequestModel>[].obs;
  RxList<AllRequestModel> listRequestDay =<AllRequestModel>[].obs;

  @override
  Future<void> onInit() async {
    listRequest.value = await AllRequestDayOffService().fetchRequest();
    super.onInit();
  }

  // bool chooseDay(DateTime date){
  //
  // }

  void filter(DateTime date){
    listRequestDay.value =<AllRequestModel>[];
    for(int i =0; i<listRequest.length; i++){
      if(date.day-DateTimeUtilities.formatDate(listRequest[i].fromDay!).day>=0 && DateTimeUtilities.formatDate(listRequest[i].fromDay!).day -date.day>=0){
        print(date.difference(DateTimeUtilities.formatDate(listRequest[i].fromDay!)).inDays);
        print(DateTimeUtilities.formatDate(listRequest[i].toDay!).difference(date).inDays);
        print(DateTimeUtilities.formatDate(listRequest[i].fromDay!));
        print(date);
        listRequestDay.add(listRequest[i]);
      }
    }
  }

}