import 'package:day_offf_app/screen/all_project/model/Project.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:day_offf_app/screen/my_project/model/user_project_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserProjectService {
  var dio = Dio();
  LoginController controller = Get.find();
  String url ="http://66.42.56.32:3000/projects/get-user-project";
  List<UserProject> listProject = <UserProject>[];

  Future<List<UserProject>> userProject() async {
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.get(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      listProject =
      List<UserProject>.from(response.data.map((e) => UserProject.fromJson(e)));
      return listProject;
    } else {
      throw Exception('Failed to load post');
    }
  }
}