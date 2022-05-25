import 'package:day_offf_app/screen/emplyee_profile/controller/ProfileController.dart';
import 'package:day_offf_app/screen/emplyee_profile/model/ProfileModel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileService {
  ProfileController profileController = Get.put(ProfileController());
  LoginController c = Get.put(LoginController());
  var dio = Dio();

  Future<void> updateEmployee(ProfileModelRequest employeeModelRequest) async {
    try {
      final response = await dio.patch(
          'http://66.42.56.32:3000/users/update-user/${c.user_id}',
          data: employeeModelRequest.toJson());
      profileController.responseData = response.data;
      print(profileController.responseData);
      print(response.statusMessage);
      profileController.responseCode = response.statusCode;
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
