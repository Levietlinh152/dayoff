import 'package:day_offf_app/routes/app_pages.dart';
import 'package:day_offf_app/screen/main/main_screen.dart';
import '../model/login_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class APIService {
  var dio = Dio();
  String url = "http://66.42.56.32:3000/auth/login";
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    final response = await dio.post(url, data: requestModel.toJson());
    print(response.statusCode);

    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar("Thanh cong", "message");
      Get.offAll(const MainScreen());
      return LoginResponseModel.fromJson(
        response.data,
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
