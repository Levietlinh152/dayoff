import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/screen/all_request/model/RequestModel.dart';
import 'package:day_offf_app/screen/all_request/service/Delete_Request_Service.dart';
import 'package:day_offf_app/screen/all_request/service/UpdateRequestService.dart';
import 'package:get/get.dart';

import '../service/AllRequestService.dart';

class UpdateRequestController extends GetxController {
  AllRequestController allRequestController = Get.find();
  var tabTextIconIndexSelected = 0;

  Future<void> updateRequest(String state, String id) async {
    AllRequestModel allRequestModel = AllRequestModel(state: state);
    UpdateRequestService updateRequestService = UpdateRequestService();
    updateRequestService.updateRequest(id, allRequestModel);
    allRequestController.onInit();
  }

  Future<void> deleteRequest(String id) async {
    DeleteRequest delete = DeleteRequest();
    delete.deleteRequest(id);
    allRequestController.onInit();
    allRequestController.listRequest.value =
        await AllRequestDayOffService().fetchRequest();
    Get.back();
  }

  int stateIndex(String state) {
    if (state == "REQUESTED") {
      return 0;
    } else if (state == "APPROVED") {
      return 1;
    }
    return 2;
  }

  String state(bool isMorning, bool isMulti) {
    if (isMorning == true) {
      return "Morning";
    } else if (isMulti == true) {
      return "Multi day";
    }
    return "Afternoon";
  }
}
