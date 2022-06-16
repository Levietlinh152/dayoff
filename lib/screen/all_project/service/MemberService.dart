import 'package:day_offf_app/screen/all_project/model/UpdateProjectModel.dart';
import 'package:day_offf_app/screen/all_project/model/add_member_model.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

LoginController controller = Get.find();

class MemberService {
  var dio = Dio();

  Future<void> updateProject(
      String id, UpdateProjectModel updateProjectModel) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
      final response = await dio.patch(
          'http://66.42.56.32:3000/projects/update-project/$id',
          data: updateProjectModel.toJson());
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<void> addMember(String id, AddMemberModel addMemberModel) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
      final response = await dio.patch(
          'http://66.42.56.32:3000/projects/add-member/$id',
          data: addMemberModel.toJson());
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
