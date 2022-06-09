import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../model/login_model.dart';
import '../service/auth.dart';

class LoginController extends GetxController {
  final apiService = APIService();
  LoginRequestModel? loginRequestModel;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   final RxString user_id =''.obs;
  RxBool isLoading = false.obs;
  var user_token;
  var responseAuthCode;

  Future<void> logIn() async {
    isLoading.value= true;
    if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
      isLoading.value= false;
      Get.snackbar('Enter your Username or Password', '');
    }
    final loginRequestModel =  LoginRequestModel(
        username: usernameController.text, password: passwordController.text);
    APIService apiService =  APIService();
    var res = await apiService.login(loginRequestModel);
    user_token = res.token;
    user_id.value = res.user_id;
    print(user_token);
    isLoading.value=false;
  }
}
