import 'package:day_offf_app/screen/all_request/service/AllRequestService.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:get/get.dart';

import '../model/RequestModel.dart';

class AllRequestController extends GetxController {
  RxList<AllRequestModel> listRequest = <AllRequestModel>[].obs;
  RxList<AllRequestModel> listPendingRequest =<AllRequestModel>[].obs;
  RxList<AllRequestModel> listApprovedRequest =<AllRequestModel>[].obs;
  LoginController loginController = Get.put(LoginController());

  @override
  Future<void> onInit() async {
    listRequest.value = await AllRequestDayOffService().fetchRequest();
    print(listRequest.value);
    listPendingRequest.value = await AllRequestDayOffService().fetchPendingRequest();
    listApprovedRequest.value = await AllRequestDayOffService().fetchApproveRequest();
    print(listRequest.length);
    print('${listPendingRequest.length}');
    print('${listApprovedRequest.length}');

    filter();
    super.onInit();
  }
  void filter(){
    listRequest.map((e){
      if(e.toDay!=null || e.fromDay!=null){
        listRequest.add(e);
      }
    });
  }
  }


