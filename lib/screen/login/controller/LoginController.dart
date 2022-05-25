import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/login_model.dart';
import '../service/auth.dart';

class LoginController extends GetxController {
  final apiService = APIService();
  LoginRequestModel? loginRequestModel;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late final String? user_id;
  var user_token;
  var responseAuthCode;

  Future<void> logIn() async {
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar('Enter your Username or Password', '');
    }
    final loginRequestModel = new LoginRequestModel(
        username: usernameController.text, password: passwordController.text);
    APIService apiService = new APIService();
    var res = await apiService.login(loginRequestModel);
    user_token = res.token;
    print(user_token.toString());
    user_id = res.user_id;
    print(user_id);
  }
}
