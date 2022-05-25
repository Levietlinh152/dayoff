import 'package:day_offf_app/routes/app_pages.dart';
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
      print(response.data);
      Get.snackbar("Thanh cong", "message");
      Get.offNamed(Routes.main);
      return LoginResponseModel.fromJson(
        response.data,
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
