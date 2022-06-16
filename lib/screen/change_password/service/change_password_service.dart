import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:day_offf_app/screen/change_password/model/UpdatePasswordModel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';


class ChangePassWord {
  var dio = Dio();
  LoginController controller = Get.find();

  Future<void> updatePassword(String? id, UpdatePasswordModel updatePasswordModel) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
      final response = await dio.patch(
          'http://66.42.56.32:3000/users/update-user/$id',
          data: updatePasswordModel.toJson());
      if(response.statusCode==200|| response.statusCode==201){
        Get.snackbar("", "Password changed successful", colorText: AppColors.success);
      return response.data;}
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}