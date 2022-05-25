import 'package:day_offf_app/screen/all_user/model/UpdateUserModel.dart';
import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class EditUserService {
  LoginController c = Get.put(LoginController());
  var dio = Dio();
  late AllUser allUser;

Future<void> updateEmployee(String? id,UpdateUserModel updateUserModel) async {
     try {
      final response = await dio.patch(
         'http://66.42.56.32:3000/users/update-user/${id}',
         data: AllUser().toJson());

     print(response.data);
     print(response.statusCode);
     print(response.statusMessage);

      return response.data;
   } on DioError catch (e) {
     return e.response!.data;
    }
   }
}
