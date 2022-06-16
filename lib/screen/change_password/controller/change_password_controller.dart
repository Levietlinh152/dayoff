import 'package:day_offf_app/screen/change_password/model/UpdatePasswordModel.dart';
import 'package:day_offf_app/screen/change_password/service/change_password_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../all_user/model/Usemodel.dart';

class ChangePasswordController extends GetxController{
  final GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  Rx<AllUser> updateUserModel = AllUser().obs;

  Future<void> updatePassword(String id, UpdatePasswordModel updatePasswordModel) async {
  await ChangePassWord().updatePassword(id, updatePasswordModel);
  }
  String? validatePassword(String value) {
    if (value.length<6) {
      return "Password must be more than 6 characters";
    }
    return null;
  }
  String? validateConfirmPassword(String value) {
    if(value != newPassword.text){
      return "Not match";
    }
    return null;
  }

}