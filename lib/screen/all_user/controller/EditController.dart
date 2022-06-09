import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/all_user/service/EditService.dart';
import 'package:get/get.dart';

import 'AllUserController.dart';

class EditUserController extends GetxController{
  Rx<AllUser> updateUserModel = AllUser().obs;
  AllUserController allUserController= Get.find();

  Future<void> upDateUser(String id, AllUser allUser) async{
    EditUserService editUserEdit =  EditUserService();
   await editUserEdit.updateEmployee(id, allUser);
   Get.back();
   allUserController.onInit();
  }
}
