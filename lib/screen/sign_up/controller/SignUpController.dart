import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../model/SignUpModel.dart';
import '../service/SignUpService.dart';

class SignUpController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController citizenIdController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String levelValue = "INTERN";

  Future<void> signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Pass word','Passwords do not match');
    }
    final signUpModel =  SignUpModel(
      fullName: fullnameController.text,
      nickName: nicknameController.text,
      email: emailController.text,
      citizenID: citizenIdController.text,
      roles: "USER",
      level: "INTERN",
      dateOfBirth: DateFormat('yyyy-MM-dd').parse(dateController.text),
      username: usernameController.text,
      password: passwordController.text,
    );
    SignUpService service =   SignUpService();
    await service.signUp(signUpModel);
    Get.snackbar('Sign Up', "Success");
    Get.toNamed(Routes.login);
  }
}
