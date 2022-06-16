import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

LoginController controller = Get.put(LoginController());

class DeleteProject {
  var dio = Dio();

  Future<void> deleteProject(String id) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
      await dio.delete('http://66.42.56.32:3000/projects/$id');
    } on Exception {}
  }
}
