import 'package:day_offf_app/screen/add_new_project/controller/Add_new_project_controller.dart';
import 'package:day_offf_app/screen/add_new_project/model/creatProjectModel.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/values/app_colors.dart';
import '../../widget/custom_text.dart';
import '../../widget/rounded_input_field.dart';
import '../all_user/model/Usemodel.dart';

class AddNewProject extends StatefulWidget {
  @override
  State<AddNewProject> createState() => _AddNewProjectState();
}

class _AddNewProjectState extends State<AddNewProject> {
  AddNewProjectController controller =
      Get.put(AddNewProjectController());
  TextEditingController projectNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController numberMemberController = TextEditingController();

  String stateValue = "Choose your PM";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
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
              textfielController: projectNameController,
              hintText: "Enter your project name",
              icon: Icons.manage_accounts_rounded,
              onChanged: (value) {},
            ),
            const Padding(
                padding: EdgeInsets.all(10),
                child: CustomText(
                  text: "Choose project manager",
                  color: Colors.grey,
                  weight: FontWeight.bold,
                )),
            Obx(()=> Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: Get.width * 0.8,
              decoration: BoxDecoration(
                color: AppColors.kPrimaryLightColor,
                borderRadius: BorderRadius.circular(29),
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
                      hint:CustomText(text: stateValue),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                      ),
                      onChanged: (AllUser? newValue) {
                        setState(() {
                          stateValue = newValue!.fullName!;
                        });
                      },
                      items: controller.listMember.value.where((element) => element.roles=="PROJECT_MANAGER")
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
                  text: " Add member",
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
                                          itemCount: controller
                                              .listUser.length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
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
                                                    child: const Icon(Icons.add)),
                                              ),
                                            );
                                          }),
                                    )),
                                Container(
                                  width: Get.width / 2,
                                  decoration: BoxDecoration(),
                                  child: Obx(
                                    () => ListView.builder(
                                        itemCount: controller
                                            .listMember.length,
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
                                                    '${controller.listMember[index].roles}',
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
                              text: 'Submit',
                              press: () {
                                Navigator.pop(context);
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
            RoundedButton(
                text: 'SUBMIT',
                press: () {
                  CreateProjectModel project = CreateProjectModel(
                    projectName: projectNameController.text,
                    member:  controller.listMember.map((element) => element.sId!).toList(),
                    projectManager: controller.listMember.where((p0) => p0.fullName==stateValue).first,
                  );
                  controller.addNewProject(project);
                  Get.back();
                })
          ],
        ),
      ),
    );
  }
}
