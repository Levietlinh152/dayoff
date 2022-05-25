// import 'package:day_offf_app/screen/all_user/DetailUser.dart';
// import 'package:day_offf_app/screen/all_user/model/UpdateUserModel.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// import '../../emplyee_profile/model/ProfileModel.dart';
// import '../../emplyee_profile/service/ProfileService.dart';
// import '../service/EditService.dart';
//
// class AllUserController extends GetxController {
//   TextEditingController dateController = TextEditingController();
//   TextEditingController fullnameController = TextEditingController();
//   TextEditingController nicknameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController citizenIdController = TextEditingController();
//   TextEditingController levelController = TextEditingController();
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   String rolesValue = "USER";
//   late String responseData;
//   late String responseCode;
//   late DetailUser detailUser;
//
//   Future<void> updateProfile() async {
//     final upDateUserModel = UpdateUserModel(
//       fullName:  fullnameController.text,
//         nickName: nicknameController.text,
//         email: emailController.text,
//         citizenID: citizenIdController.text,
//       roles: rolesValue,
//       dateOfBirth: DateFormat('yyyy-MM-dd').parse(dateController.text),
//     );
//     EditUserService editUserService = EditUserService();
//     await editUserService.updateEmployee(detailUser.user.sId,upDateUserModel);
//     // ignore: unrelated_type_equality_checks
//     print(responseData);
//     print(responseCode);
//     if (responseData != null && responseCode == 200) {
//       Get.snackbar("Update success", "message");
//     }
//   }
// }
