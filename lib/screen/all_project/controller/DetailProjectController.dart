import 'package:day_offf_app/screen/all_project/controller/ProjectController.dart';
import 'package:day_offf_app/screen/all_project/model/add_member_model.dart';
import 'package:day_offf_app/screen/all_user/controller/AllUserController.dart';
import 'package:get/get.dart';
import '../../all_user/model/Usemodel.dart';
import '../../all_user/service/AllService.dart';
import '../service/MemberService.dart';

class DetailProjectController extends GetxController {
  ProjectController projectController = Get.find();
  AllUserController allUserController = Get.find();
  RxList<AllUser> listUser = <AllUser>[].obs;
  RxList<AllUser> listMember = <AllUser>[].obs;
  RxList<String> listMemberId= <String>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    listMember.value =
    projectController.listProject[projectController.index.value].member!;
    listUser.value = await AllService().fetchPost();
    listUserFilter();
  }
  Future<void> addMemberController(String id, AddMemberModel addMemberModel) async{
    MemberService memberService =  MemberService();
    await memberService.addMember(id, addMemberModel);
    controller.onInit();
    Get.back();
  }
  List<String> listId() {
      for (int i = 0; i < listMember.length; i++) {
     listMemberId.add(listMember[i].sId!);
      }
    return listMemberId;
  }
  List<AllUser> listUserFilter() {
    for (int i = 0; i < listUser.length; i++) {
      for (int j = 0; j < listMember.length; j++) {
        if (listUser[i].sId == listMember[j].sId) {
          listUser.remove(listUser[i]);
        }
      }
    }
    return listUser;
  }
  void addMember(int index) {
    for (int i = 0; i <= listUser.length; i++) {
      if (i == index) {
        listMember.add(listUser[index]);
        listUser.remove(listUser[index]);
      }
    }
  }

  void removeMember(int index) {
    for (int i = 0; i <= listMember.length; i++) {
      if (i == index) {
        listUser.add(listMember[index]);
        listMember.remove(listMember[index]);
      }
    }
  }

}
