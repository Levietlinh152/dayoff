import 'package:get/get.dart';
import '../model/ProfileModel.dart';
import '../service/ProfileService.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController citizenIdController = TextEditingController();
  ProfileModelRequest? employeeModelRequest;
  // ignore: prefer_typing_uninitialized_variables
  var responseCode;
  // ignore: prefer_typing_uninitialized_variables
  var responseMess;
  // ignore: prefer_typing_uninitialized_variables
  var responseData;

  Future<void> updateProfile() async {
    final profileModelRequest = ProfileModelRequest(
        nickName: nicknameController.text,
        email: emailController.text,
        citizenID: citizenIdController.text);
    ProfileService profileService = ProfileService();
    await profileService.updateEmployee(profileModelRequest);
    if (responseData != null && responseCode == 200) {
      Get.snackbar("Update success", "message");
    }
  }
}
