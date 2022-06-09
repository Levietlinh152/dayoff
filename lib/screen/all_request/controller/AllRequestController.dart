// ignore: file_names
import 'package:day_offf_app/screen/all_request/service/AllRequestService.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import '../model/RequestModel.dart';

class AllRequestController extends GetxController {
  RxList<AllRequestModel> listRequest = <AllRequestModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllRequest();
    super.onInit();
  }

  Future<void> getAllRequest() async {
    isLoading.value = true;
    listRequest.value = await AllRequestDayOffService().fetchRequest();
    isLoading.value=false;
  }

  Color stateColor(String state) {
    if (state == "REQUESTED") {
      return Colors.orangeAccent;
    }
    else if (state == "APPROVED") {
      return Colors.green;
    } else
      return Colors.redAccent;
  }
}
