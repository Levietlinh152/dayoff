import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/Usemodel.dart';

class AllService {
  LoginController controller = Get.find();
  var dio = Dio();

  String url = "http://66.42.56.32:3000/users/get-all-users";
  List<AllUser> listUser = <AllUser>[];

  Future<List<AllUser>> fetchPost() async {
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      // final List<dynamic> list = json.decode(response.data);
      listUser =
          List<AllUser>.from(response.data.map((e) => AllUser.fromJson(e)));
      return listUser;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<void> deleteUser(String id) async {
    dio.options.headers["Authorization"] = "Bearer ${controller.user_token}";
        final response = await dio.delete('http://66.42.56.32:3000/users/delete/$id');
        if(response.statusCode==200|| response.statusCode==201){
          Get.snackbar("Delete", 'Delete user successful');
        }
        else {
          Get.snackbar("Error", response.statusMessage.toString());
        }

  }
}
