import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../all_request/model/RequestModel.dart';

class PendingRequestService {
  LoginController controller = Get.find();
  List<AllRequestModel> listPendingRequest = <AllRequestModel>[];
  var dio = Dio();
  var options = BaseOptions(
    contentType: 'application/json',
  );
  Future<List<AllRequestModel>> fetchPendingRequest() async {
    String url = "http://66.42.56.32:3000/request/get-all-pending-request";
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.get(url,
        options: Options(
          contentType: "application/json",
        ));

    if (response.statusCode == 200) {
      listPendingRequest = List<AllRequestModel>.from(
          response.data.map((e) => AllRequestModel.fromJson(e)));
      return listPendingRequest;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
