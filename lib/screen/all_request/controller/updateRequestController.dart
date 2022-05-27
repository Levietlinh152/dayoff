import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/screen/all_request/model/RequestModel.dart';
import 'package:day_offf_app/screen/all_request/service/UpdateRequestService.dart';
import 'package:get/get.dart';

class UpdateRequestController extends GetxController {
AllRequestController allRequestController = Get.find();
  Future<void> updateRequest(String state , String id) async {
    AllRequestModel allRequestModel =  AllRequestModel(
      state: state
    );
    UpdateRequestService updateRequestService =  UpdateRequestService();
    updateRequestService.updateRequest( id, allRequestModel);
    allRequestController.onInit();
  }
   int stateIndex(String state){
    if(state=="REQUESTED"){
      return 0;
    }
    else {
      return 1;
    }
  }
}
