import 'package:day_offf_app/screen/all_request/model/RequestModel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:day_offf_app/screen/my_request/service/my_request_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRequestController extends GetxController {
  LoginController loginController = Get.find();
  RxList<AllRequestModel> myRequest = <AllRequestModel>[].obs;
  RxList<AllRequestModel> myRequestFilter = <AllRequestModel>[].obs;


  @override
  Future<void> onInit() async {
    super.onInit();
    myRequest.value = await MyRequestService().getlistUserRequest();
    myRequest.value = myRequest.where((p0) => p0.state !="REJECTED").toList();
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
