import 'dart:math';

import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../all_request/model/RequestModel.dart';

LoginController loginController = Get.find();

class MyRequestService {
  List<AllRequestModel> listUserRequest = <AllRequestModel>[];
  var dio = Dio();
  var options = BaseOptions(
    contentType: 'application/json',
  );
  Future<List<AllRequestModel>> getlistUserRequest() async {
    String url = "http://66.42.56.32:3000/request/get-user-request";
    dio.options.headers["Authorization"] =
        "Bearer ${loginController.user_token}";
    final response = await dio.get(url,
        options: Options(
          contentType: "application/json",
        ));

    if (response.statusCode == 200) {
      listUserRequest = RxList<AllRequestModel>.from(
          response.data.map((e) => AllRequestModel.fromJson(e)));
      return listUserRequest;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
