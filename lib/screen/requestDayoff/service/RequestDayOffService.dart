import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:day_offf_app/screen/requestDayoff/model/DayOff.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

LoginController controller = Get.put(LoginController());

class RequestDayOffService {
  var dio = Dio();
  var options = BaseOptions(
    baseUrl: "http://66.42.56.32:3000/request/create-request",
    contentType: 'application/json',
  );
  Future<void> requestDayOff(DayOff dayOff) async {
    print(controller.user_token);
    String url = "http://66.42.56.32:3000/request/create-request";
    try {
      dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
      print(controller.user_token);
      final response = await dio.post(url,
          data: dayOff.toJson(),
          options: Options(
            contentType: "application/json",
          ));
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('successes');
        Get.snackbar("Success", 'message');
      }
    } catch (Exception) {
      print(Exception);
    }
  }
}
