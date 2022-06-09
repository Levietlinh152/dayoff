import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileService {
  LoginController controller = Get.find();
  var dio = Dio();
  Future<AllUser> getUser() async {
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.get("http://66.42.56.32:3000/users/get-user/${controller.user_id.value}");
    if (response.statusCode == 200) {
      return  AllUser.fromJson(response.data);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
