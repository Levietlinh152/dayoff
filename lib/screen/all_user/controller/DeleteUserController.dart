import 'package:day_offf_app/screen/all_user/controller/AllUserController.dart';
import 'package:day_offf_app/screen/all_user/service/AllService.dart';
import 'package:get/get.dart';


AllUserController controller = Get.find();
class DeleteUserController extends GetxController{
  Future<void> deleteUser(String id) async {
    AllService().deleteUser(id);
    controller.onInit();
    controller.futureStudent.value = await AllService().fetchPost();
    Get.back();
  }
}