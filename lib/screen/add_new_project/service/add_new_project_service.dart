import 'package:day_offf_app/screen/add_new_project/model/creatProjectModel.dart';
import 'package:day_offf_app/screen/all_project/model/Project.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AddNewProjectService {
  var dio = Dio();
  LoginController controller = Get.find();
  Future<void> addNewProject(CreateProjectModel createProjectModel) async {
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.post(
        'http://66.42.56.32:3000/projects/create-project',
        data: createProjectModel.toJson());
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar("Success", 'message');
    }
  }
}
