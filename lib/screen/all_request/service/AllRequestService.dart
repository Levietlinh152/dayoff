import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/screen/all_request/model/RequestModel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

LoginController controller = Get.put(LoginController());
AllRequestController requestController = AllRequestController();

class AllRequestDayOffService {
  List<AllRequestModel> listAllRequest = <AllRequestModel>[];
  List<AllRequestModel> listPendingRequest = <AllRequestModel>[];
  List<AllRequestModel> listApprovedRequest = <AllRequestModel>[];

  var dio = Dio();
  var options = BaseOptions(
    contentType: 'application/json',
  );
  Future<List<AllRequestModel>> fetchRequest() async {
    String url = "http://66.42.56.32:3000/request/get-all-request";
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.get(url,
        options: Options(
          contentType: "application/json",
        ));

    if (response.statusCode == 200) {
      listAllRequest = RxList<AllRequestModel>.from(
          response.data.map((e) => AllRequestModel.fromJson(e)));
      return listAllRequest;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<AllRequestModel>> fetchPendingRequest() async {
    String url = "http://66.42.56.32:3000/request/get-all-pending-request";
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.get(url,
        options: Options(
          contentType: "application/json",
        ));

    if (response.statusCode == 200) {
      listPendingRequest = RxList<AllRequestModel>.from(
          response.data.map((e) => AllRequestModel.fromJson(e)));
      return listPendingRequest;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<List<AllRequestModel>> fetchApproveRequest() async {
    String url = "http://66.42.56.32:3000/request/get-all-approved-request";
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.get(url,
        options: Options(
          contentType: "application/json",
        ));

    if (response.statusCode == 200) {
      listApprovedRequest = RxList<AllRequestModel>.from(
          response.data.map((e) => AllRequestModel.fromJson(e)));
      return listApprovedRequest;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
