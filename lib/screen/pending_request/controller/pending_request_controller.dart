import 'package:day_offf_app/screen/pending_request/service/pending_request_service.dart';
import 'package:get/get.dart';

import '../../all_request/model/RequestModel.dart';

class PendingRequestController extends GetxController {
  RxList<AllRequestModel> listPendingRequest = <AllRequestModel>[].obs;
  @override
  Future<void> onInit() async {
    listPendingRequest.value =
        await PendingRequestService().fetchPendingRequest();
    super.onInit();
  }
}
