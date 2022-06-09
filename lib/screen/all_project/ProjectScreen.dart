import 'package:day_offf_app/screen/add_new_project/AddNewProject.dart';
import 'package:day_offf_app/screen/all_project/DetailProject.dart';
import 'package:day_offf_app/screen/all_project/controller/ProjectController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/values/app_colors.dart';
import '../../widget/custom_text.dart';
class ProjectScreen extends StatefulWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  ProjectController controller = Get.put(ProjectController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add new project'),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                Get.to(AddNewProject());
              },
            )
          ],
        ),
        body: Center(
                child: Obx(
                      () => ListView.builder(
                      itemCount: controller.listProject.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            margin: const EdgeInsets.all(10),
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom:
                                  BorderSide(width: 1.0, color: AppColors.border),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(DetailProject(project: controller.listProject[index]));
                                  controller.index.value= index;
                                },
                                child: ListTile(
                                  leading: const Icon(Icons.task,size: 40,),
                                  title: CustomText(
                                    text:
                                    controller.listProject[index].projectName.toString(),
                                    size: 20,
                                    color: AppColors.black,
                                    weight: FontWeight.bold,
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_today_outlined,
                                            size: 15,
                                          ),
                                          CustomText(
                                            text: controller.listProject[index].startDate.toString().substring(0,10),
                                            size: 15,
                                            color: AppColors.doveGray,
                                            weight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.manage_accounts_rounded,
                                            size: 15,
                                          ),
                                          CustomText(
                                            text:" ${controller.listProject[index].projectManager!.fullName.toString()}",
                                            size: 15,
                                            color: AppColors.doveGray,
                                            weight: FontWeight.w500,
                                          )
                                        ],
                                      ),
                                      CustomText(
                                        text:
                                        'Member : ${controller.listProject[index].member!.length.toString()}',
                                        size: 15,
                                        weight: FontWeight.w500,
                                      ),

                                      CustomText(
                                        text:
                                        'State : ${controller.listProject[index].state}',
                                        size: 15,
                                        color: controller.stateColor(controller.listProject[index].state.toString()),
                                        weight: FontWeight.w500,
                                      ),
                                    ],
                                  ),
                                  isThreeLine: true,
                                  trailing: Column(
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                                  children :[
                                      Container(
                                      decoration:  BoxDecoration(
                                        color: controller.stateColor(controller.listProject[index].state.toString()),
                                          borderRadius:
                                           const BorderRadius.all(Radius.circular(5))
                                      ),
                                      child: CustomText( text: "  ${controller.listProject[index].state.toString()}  ",color: Colors.white,),
                                    ),
                                    ]
                                  ),
                                ),
                              ),
                            ));
                      }),
                ),
              ),
    );
  }

}