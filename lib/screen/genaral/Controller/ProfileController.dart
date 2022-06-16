import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/genaral/Service/ProfileService.dart';
import 'package:day_offf_app/screen/login/controller/LoginController.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  LoginController loginController = Get.find();
  Rx<AllUser> user = AllUser().obs;
  RxString role = ''.obs;
  @override
  Future<void> onInit() async {
    user.value = await ProfileService().getUser();
    role.value = user.value.roles!;
    super.onInit();
  }
}
