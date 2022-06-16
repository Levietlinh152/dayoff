import 'package:day_offf_app/screen/all_project/model/Project.dart';
import 'package:day_offf_app/screen/all_project/service/ProjectService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectController extends GetxController {
  RxList<Project> listProject = <Project>[].obs;
  RxInt index = 0.obs;
  @override
  Future<void> onInit() async {
    listProject.value = await ProjectService().fechProject();
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
