import 'package:day_offf_app/screen/my_project/model/user_project_model.dart';
import 'package:day_offf_app/screen/my_project/service/my_project_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProjectController extends GetxController{
  RxList<UserProject> listProject = <UserProject>[].obs;
  RxInt index = 0.obs;

  @override
  Future<void> onInit() async {
    listProject.value = await UserProjectService().userProject();
    super.onInit();
  }

  Color stateColor(String state) {
    if (state == "RUNNING") {
      return Colors.orangeAccent;
    } else if (state == "DONE") {
      return Colors.green;
    } else {
      return Colors.redAccent;
    }
  }
}