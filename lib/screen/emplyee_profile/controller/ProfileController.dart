import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/ProfileModel.dart';
import '../service/ProfileService.dart';

class ProfileController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController citizenIdController = TextEditingController();
  ProfileModelRequest? employeeModelRequest;
  var responseCode;
  var responseMess;
  var responseData;

Future<void> updateProfile() async {
  final  profileModelRequest = new ProfileModelRequest(
    nickName: nicknameController.text,
    email: emailController.text,
    citizenID: citizenIdController.text
  );
  ProfileService profileService = new ProfileService();
    await profileService.updateEmployee(profileModelRequest);
    if( responseData!=null && responseCode==200){
      Get.snackbar("Update success", "message");
    }
}
}