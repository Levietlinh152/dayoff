import 'package:day_offf_app/screen/pm_project/model/pm_project_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../login/controller/LoginController.dart';

class PmProjectService {
  var dio = Dio();
  LoginController controller = Get.find();
  String url = "http://66.42.56.32:3000/projects/get-pm-project";
  List<PmProjectModel> listProject = <PmProjectModel>[];

  Future<List<PmProjectModel>> userProject() async {
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      listProject =
      List<PmProjectModel>.from(
          response.data.map((e) => PmProjectModel.fromJson(e)));
      return listProject;
    } else {
      throw Exception('Failed to load post');
    }
  }
}