import 'package:day_offf_app/screen/all_user/model/UpdateUserModel.dart';
import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class EditUserService {
  var dio = Dio();

  Future<void> updateEmployee(
      String? id, AllUser allUser) async {
    try {
      final response = await dio.patch(
          'http://66.42.56.32:3000/users/update-user/$id',
          data: allUser.toJson());
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
