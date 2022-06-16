import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/all_user/service/EditService.dart';
import 'package:day_offf_app/screen/genaral/Controller/ProfileController.dart';
import 'package:get/get.dart';

class UpdateEmployeeController extends GetxController {
  Rx<AllUser> updateUserModel = AllUser().obs;
  ProfileController profileController = Get.find();

  Future<void> upDateUser(String id, AllUser allUser) async {
    EditUserService editUserEdit = EditUserService();
    await editUserEdit.updateEmployee(id, allUser);
    profileController.onInit();
    Get.back();
  }
}
