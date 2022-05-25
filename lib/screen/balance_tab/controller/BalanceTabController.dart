import 'package:get/get.dart';

import '../../all_request/controller/AllRequestController.dart';
import '../../all_request/model/RequestModel.dart';

class BalanceTabController extends GetxController{
  AllRequestController allRequestController = Get.put(AllRequestController());
  RxList<AllRequestModel> pendingRequest =<AllRequestModel>[].obs;
  @override
  void onInit() {
    pendingRequest.value=allRequestController.listRequest.where((i) => i.state=="REQUESTED").toList();
    super.onInit();
  }
// void filterList(){
//  pendingRequest.value=allRequestController.listRequest.where((i) => i.state=="REQUESTED").toList();
// }
}