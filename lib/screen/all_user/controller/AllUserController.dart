import 'package:day_offf_app/screen/all_user/DetailUser.dart';
import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/all_user/service/AllService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllUserController extends GetxController {
  TextEditingController dateController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController citizenIdController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxList<AllUser> futureStudent = <AllUser>[].obs;
  String rolesValue = "USER";
  late String responseData;
  late String responseCode;
  late DetailUser detailUser;
  @override
  void onInit() async{
    // TODO: implement onInit
    futureStudent.value= await AllService().fetchPost();
    super.onInit();
  }
}
