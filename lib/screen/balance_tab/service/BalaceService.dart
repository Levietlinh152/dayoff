import 'dart:io';
import 'package:day_offf_app/screen/all_request/model/RequestModel.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:day_offf_app/screen/requestDayoff/model/DayOff.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

LoginController controller = Get.put(LoginController());
class BalanceService{
  var dio = Dio();
  List<AllRequestModel> pendingRequestList = <AllRequestModel>[];
  List<AllRequestModel> approvedRequestList = <AllRequestModel>[];

  var options = BaseOptions(
    contentType:'application/json',
  );


  Future<List<AllRequestModel>> fetchPendingRequest() async {
    print(controller.user_token);
    String url = "http://66.42.56.32:3000/request/get-all-pending-request/${controller.user_id}";
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    print(controller.user_token);
    final response = await dio.get(url,
        options: new Options(
          contentType:"application/json",
        )
    );
    print("PENDING code:${response.statusCode}");
    print(controller.user_token);
    print(response.data);

    if (response.statusCode == 200) {
      print(response.data);
      // final List<dynamic> list = json.decode(response.data);
      print(response.data.map((e) => AllRequestModel.fromJson(e)).toList());
      pendingRequestList=List<AllRequestModel>.from( response.data.map((e) => AllRequestModel.fromJson(e)));
      return pendingRequestList;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }


  Future<List<AllRequestModel>> fetchApprovedRequest() async {
    print(controller.user_token);
    String url = "http://66.42.56.32:3000/request/get-all-approved-request/${controller.user_id}";
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    print(controller.user_token);
    final response = await dio.get(url,
        options: new Options(
          contentType:"application/json",
        )
    );
    print("approved code:${response.statusCode}");
    print(controller.user_token);
    print(response.data);

    if (response.statusCode == 200) {
      print(response.data);
      // final List<dynamic> list = json.decode(response.data);
      print(response.data.map((e) => AllRequestModel.fromJson(e)).toList());
      approvedRequestList=List<AllRequestModel>.from( response.data.map((e) => AllRequestModel.fromJson(e)));
      return approvedRequestList;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

}