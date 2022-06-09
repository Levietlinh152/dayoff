import 'package:day_offf_app/screen/request_tab/service/request_tab_service.dart';
import 'package:get/get.dart';
import '../../all_request/model/RequestModel.dart';

class RequestTabController extends GetxController {
  RxList<AllRequestModel> pendingRequest = <AllRequestModel>[].obs;
  RxList<AllRequestModel> listRequest =<AllRequestModel>[].obs;

  @override
  void onInit() async {
    pendingRequest.value = await RequestTabService().fetchPendingRequest();
    listRequest.value = await RequestTabService().fetchApprovedRequest();
    super.onInit();
  }
}
