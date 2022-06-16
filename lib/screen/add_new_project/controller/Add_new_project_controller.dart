import 'package:day_offf_app/screen/add_new_project/model/creatProjectModel.dart';
import 'package:day_offf_app/screen/add_new_project/service/add_new_project_service.dart';
import 'package:day_offf_app/screen/all_project/controller/ProjectController.dart';
import 'package:get/get.dart';
import '../../all_user/model/Usemodel.dart';
import '../../all_user/service/AllService.dart';

class AddNewProjectController extends GetxController {
  ProjectController projectController = Get.find();
  Future<void> addNewProject(CreateProjectModel createProjectModel) async {
    AddNewProjectService addNewProjectService = AddNewProjectService();
    await addNewProjectService.addNewProject(createProjectModel);
    projectController.onInit();
  }

  RxList<AllUser> listUser = <AllUser>[].obs;
  RxList<AllUser> listMember = <AllUser>[].obs;
  RxList<String> listStringId = <String>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    listUser.value = await AllService().fetchPost();
    listStringId.value = listMember.map((element) => element.sId!).toList();
  }

  void addMember(int index) {
    for (int i = 0; i <= listUser.length; i++) {
      if (i == index) {
        listMember.add(listUser[index]);
        listUser.remove(listUser[index]);
        listStringId();
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

  List<String> listId() {
    for (int i = 0; i < listUser.length; i++) {
      listStringId.add(listUser[i].sId!);
    }
    return listStringId;
  }
}
