import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';
import '../model/SignUpModel.dart';
import '../service/SignUpService.dart';

class SignUpController extends GetxController {
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

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

    final signUpModel = SignUpModel(
      fullName: fullnameController.text,
      nickName: nicknameController.text,
      email: emailController.text,
      citizenID: citizenIdController.text,
      roles: "USER",
      level: levelValue,
      dateOfBirth: DateFormat('yyyy-MM-dd').parse(dateController.text),
      username: usernameController.text,
      password: passwordController.text,
    );
    SignUpService service = SignUpService();
    await service.signUp(signUpModel);
    Get.snackbar('Sign Up', "Success");
    Get.toNamed(Routes.login);
  }
  @override
  void onInit() {
    super.onInit();
     dateController = TextEditingController();
     fullnameController = TextEditingController();
     nicknameController = TextEditingController();
     emailController = TextEditingController();
     citizenIdController = TextEditingController();
     levelController = TextEditingController();
     usernameController = TextEditingController();
     passwordController = TextEditingController();
     confirmPasswordController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    dateController.dispose();
    fullnameController.dispose();
    nicknameController.dispose();
    emailController.dispose();
    citizenIdController.dispose();
    levelController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }
  String? validateUsername(String value) {
    if (value.isEmpty) {
      return "Username must be provided ";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length<6) {
      return "Password must be more than 6 characters";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.length!=9 || value.length != 12) {
      return "Please enter correct Cityzen ID";
    }
    return null;
  }
  String? validateConfirmPassword(String value) {
    if (value.isEmpty) {
      return "Password must be provided";
    }
    return null;
  }
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Email must be provided";
    }
    else if(!value.isEmail){
      return "Enter correct email";

    }
    return null;
  }
  String? validateFullname(String value) {
    if (value.isEmpty) {
      return "Enter you full name";
    }
    return null;
  }
}
