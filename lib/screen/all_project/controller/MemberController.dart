import 'package:day_offf_app/screen/all_project/model/UpdateProjectModel.dart';
import 'package:day_offf_app/screen/all_project/service/MemberService.dart';
import 'package:get/get.dart';
import 'ProjectController.dart';

class MemberController extends GetxController{
  ProjectController controller = Get.find();

  Future<void> updateProject(String id, UpdateProjectModel updateProjectModel) async{
    MemberService memberService =  MemberService();
    await memberService.updateProject(id, updateProjectModel);
    controller.onInit();
    Get.back();
  }


}