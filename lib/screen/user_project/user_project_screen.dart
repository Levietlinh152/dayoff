import 'package:day_offf_app/screen/all_project/controller/DetailProjectController.dart';
import 'package:day_offf_app/screen/all_project/controller/MemberController.dart';
import 'package:day_offf_app/screen/all_project/controller/ProjectController.dart';
import 'package:day_offf_app/screen/all_project/model/UpdateProjectModel.dart';
import 'package:day_offf_app/screen/all_project/model/add_member_model.dart';
import 'package:day_offf_app/screen/my_project/model/user_project_model.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/values/app_colors.dart';
import '../../widget/custom_text.dart';
import '../../widget/rounded_input_field.dart';
import '../all_user/model/Usemodel.dart';


class UserProjectScreen extends StatefulWidget {
  UserProjectScreen({Key? key, required this.project}) : super(key: key);
  late UserProject project;

  @override
  State<UserProjectScreen> createState() => _UserProjectScreenState();
}

class _UserProjectScreenState extends State<UserProjectScreen> {
  MemberController memberController = Get.put(MemberController());
  DetailProjectController controller = Get.put(DetailProjectController());
  ProjectController projectController = Get.find();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController numberMemberController = TextEditingController();
  String stateValue = "INCOMING";
  String pmValue = "Choose Project PM";
  bool _isShown = true;

  @override
  void initState() {
    stateValue = widget.project.state.toString();
    pmValue = widget.project.projectManager!.fullName.toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            const Padding(
                padding: EdgeInsets.all(10),
                child: CustomText(
                  text: "Project Name",
                  color: Colors.grey,
                  weight: FontWeight.bold,
                )),
            RoundedInputField(
              textfielController: projectNameController
                ..text = widget.project.projectName.toString(),
              hintText: "State",
              icon: Icons.manage_accounts_rounded,
              onChanged: (value) {},
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: CustomText(
                  text: "Project Manager",
                  color: Colors.grey,
                  weight: FontWeight.bold,
                )),
            Obx(() => Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: Get.width * 0.8,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.manage_accounts_rounded,
                    color: AppColors.kPrimaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<AllUser>(
                      hint: CustomText(
                        text: pmValue,
                      ),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (AllUser? newValue) {
                        setState(() {
                          pmValue = newValue!.fullName!;
                        });
                      },
                      items: controller.listMember.value
                          .where((element) =>
                      element.roles == "PROJECT_MANAGER")
                          .map<DropdownMenuItem<AllUser>>((AllUser value) {
                        return DropdownMenuItem<AllUser>(
                          value: value,
                          child: Text(value.fullName!),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )),
            const Padding(
                padding: EdgeInsets.all(10),
                child: CustomText(
                  text: "Project state",
                  color: Colors.grey,
                  weight: FontWeight.bold,
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: Get.width * 0.8,
              decoration:const  BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.manage_accounts_rounded,
                    color: AppColors.kPrimaryColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: DropdownButton<String>(
                      hint: CustomText(text: stateValue),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          stateValue = newValue!;
                        });
                      },
                      items: <String>['INCOMING', 'RUNNING', 'DONE']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: CustomText(
                  text: "Project member",
                  color: Colors.grey,
                  weight: FontWeight.bold,
                )),
            RoundedInputField(
              textfielController: numberMemberController
                ..text = "Choose your member",
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.grey,
                      child: Center(
                        child: Column(children: [
                          const Padding(
                              padding: EdgeInsets.all(5),
                              child: CustomText(
                                text: "ADD USER TO PROJECT",
                                weight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: Get.height / 2 - 65,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                    decoration: const BoxDecoration(),
                                    width: Get.width / 2,
                                    child: Obx(
                                          () => ListView.builder(
                                          itemCount: controller.listUser.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Card(
                                              margin: const EdgeInsets.all(10),
                                              child: ListTile(
                                                leading: const Icon(
                                                  Icons.account_circle,
                                                  size: 40,
                                                ),
                                                title: CustomText(
                                                  text:
                                                  '${controller.listUser[index].fullName}',
                                                  size: 15,
                                                ),
                                                subtitle: CustomText(
                                                  text:
                                                  '${controller.listUser[index].level}',
                                                  size: 10,
                                                  color: Colors.grey,
                                                ),
                                                trailing: InkWell(
                                                    onTap: () {
                                                      controller
                                                          .addMember(index);
                                                    },
                                                    child:
                                                    const Icon(Icons.add)),
                                              ),
                                            );
                                          }),
                                    )),
                                Container(
                                  width: Get.width / 2,
                                  decoration: BoxDecoration(),
                                  child: Obx(
                                        () => ListView.builder(
                                        itemCount: controller.listMember.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Card(
                                            margin: const EdgeInsets.all(10),
                                            child: ListTile(
                                              leading: const Icon(
                                                  Icons.account_circle),
                                              title: CustomText(
                                                text:
                                                '${controller.listMember[index].fullName}',
                                              ),
                                              subtitle: CustomText(
                                                text:
                                                '${controller.listMember[index].level}',
                                                color: Colors.grey,
                                              ),
                                              trailing: InkWell(
                                                  onTap: () {
                                                    controller
                                                        .removeMember(index);
                                                  },
                                                  child:
                                                  const Icon(Icons.delete)),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RoundedButton(
                              text: 'Submit member',
                              press: () {
                                AddMemberModel addMemberModel = AddMemberModel(
                                  member: controller.listMember.value
                                      .map((e) => e.sId!)
                                      .toList(),
                                );
                                controller.addMemberController(
                                    widget.project.sId!, addMemberModel);
                              })
                        ]),
                      ),
                    );
                  },
                );
              },
              hintText: "date of birth",
              icon: Icons.people_alt,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }

}
