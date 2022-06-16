import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

LoginController controller = Get.put(LoginController());

class DeleteRequest {
  var dio = Dio();

  Future<void> deleteRequest(String id) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
      final response = await dio
          .delete('http://66.42.56.32:3000/request/remove-request/$id');
      if (response.statusCode == 200 || response.statusCode == 201) {}
      // ignore: empty_catches
    } on Exception {}
  }
}
