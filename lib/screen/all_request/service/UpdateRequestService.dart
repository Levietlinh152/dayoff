import 'package:day_offf_app/screen/all_request/model/RequestModel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

LoginController controller = Get.put(LoginController());

class UpdateRequestService {
  var dio = Dio();

  Future<void> updateRequest(String id, AllRequestModel allRequestModel) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
      final response = await dio.patch(
          'http://66.42.56.32:3000/request/update-request/$id',
          data: allRequestModel.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
      }
    } catch (Exception) {
    }
  }
}
