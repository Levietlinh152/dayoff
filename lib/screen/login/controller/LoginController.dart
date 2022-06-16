import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/login_model.dart';
import '../service/auth.dart';

class LoginController extends GetxController {

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final apiService = APIService();
  LoginRequestModel? loginRequestModel;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final RxString user_id = ''.obs;
  RxBool isLoading = false.obs;
  var user_token;
  var responseAuthCode;

  Future<void> logIn() async {
    isLoading.value = true;
    final loginRequestModel = LoginRequestModel(
        username: usernameController.text, password: passwordController.text);
    APIService apiService = APIService();
    var res = await apiService.login(loginRequestModel);
    user_token = res.token;
    user_id.value = res.user_id;
    print(user_token);
    isLoading.value = false;
  }


  String? validateUsername(String value) {
    if (value.isEmpty) {
      return "Username must be provided ";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Password must be provided";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
  }


}
