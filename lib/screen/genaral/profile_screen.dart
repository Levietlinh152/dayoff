import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:day_offf_app/constants/app_url.dart';
import 'package:day_offf_app/screen/Holiday/Holiday.dart';
import 'package:day_offf_app/screen/all_project/ProjectScreen.dart';
import 'package:day_offf_app/screen/all_project/controller/ProjectController.dart';
import 'package:day_offf_app/screen/all_request/AllRequestScreen.dart';
import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/screen/all_request/service/AllRequestService.dart';
import 'package:day_offf_app/screen/all_user/AllUserScreen.dart';
import 'package:day_offf_app/screen/all_user/controller/AllUserController.dart';
import 'package:day_offf_app/screen/all_user/service/AllService.dart';
import 'package:day_offf_app/screen/genaral/Controller/ProfileController.dart';
import 'package:day_offf_app/screen/my_project/my_project_screen.dart';
import 'package:day_offf_app/screen/pm_project/pm_project_screen.dart';
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class ProfileScreen extends StatelessWidget {
  AllService allService = AllService();
  AllRequestController allRequestController = Get.put(AllRequestController());
  AllUserController allUserController = Get.put(AllUserController());
  ProjectController projectController = Get.put(ProjectController());
  ProfileController controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Column(children: [
              Expanded(
                flex: 2,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage(AppUrl.avatar_url),
                            radius: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Obx(
                              () => Text(
                                "${controller.user.value.fullName}",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Holiday',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87),
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  Get.to(HolidayScreen());
                                },
                                elevation: 2.0,
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.calendar_month_sharp,
                                  color: Colors.lightBlue[900],
                                  size: 35.0,
                                ),
                                padding: const EdgeInsets.all(15.0),
                                shape: const CircleBorder(),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Setting',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87),
                              ),
                              RawMaterialButton(
                                onPressed: () {
                                  Get.toNamed(Routes.setting);
                                },
                                elevation: 2.0,
                                fillColor: Colors.white,
                                child: Icon(
                                  Icons.settings,
                                  size: 35.0,
                                  color: Colors.lightBlue[900],
                                ),
                                padding: const EdgeInsets.all(15.0),
                                shape: const CircleBorder(),
                              )
                            ],
                          )
                        ],
                      ),
                    ]),
              ),
              controller.role == "ADMIN"
                  ? Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(AllScreen());
                                allUserController.onInit();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 15.0,
                                        offset: Offset(0.0, 0.75))
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Obx(
                                  () => ListTile(
                                    leading: const Icon(
                                      Icons.supervised_user_circle_outlined,
                                      size: 40,
                                      color: AppColors.clTextStatus,
                                    ),
                                    title: CustomText(
                                      text:
                                          "${allUserController.futureStudent.length}",
                                      size: 20,
                                    ),
                                    subtitle: const CustomText(
                                      text: 'USERS',
                                      color: Colors.grey,
                                      size: 20,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () => {
                                Get.to(const ProjectScreen()),
                                projectController.onInit()
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 15.0,
                                        offset: Offset(0.0, 0.75))
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Obx(
                                  () => ListTile(
                                    leading: const Icon(
                                      Icons.work_outline,
                                      size: 40,
                                      color: AppColors.clTextStatus,

                                    ),
                                    title: CustomText(
                                      text:
                                          "${projectController.listProject.length}",
                                      size: 20,
                                    ),
                                    subtitle: const CustomText(
                                      text: 'Project',
                                      color: Colors.grey,
                                      size: 20,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () async => {
                                Get.to(AllRequest()),
                                allRequestController.listRequest.value =
                                    await AllRequestDayOffService()
                                        .fetchRequest()
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 15.0,
                                        offset: Offset(0.0, 0.75))
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: Obx(
                                  () => ListTile(
                                    leading: const Icon(
                                      Icons.calendar_month,
                                      size: 40,
                                      color: AppColors.clTextStatus,
                                    ),
                                    title: CustomText(
                                      text:
                                          "${allRequestController.listRequest.length}",
                                      size: 20,
                                    ),
                                    subtitle: const CustomText(
                                      text: 'Request',
                                      color: Colors.grey,
                                      size: 20,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                  : Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async => {
                              // ignore: unrelated_type_equality_checks
                              controller.role == "USER" ? Get.to(MyProject()):Get.to(PmProjectScreen())
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: const <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 15.0,
                                        offset: Offset(0.0, 0.75))
                                  ],
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                ),
                                child: const ListTile(
                                  leading: Icon(
                                    Icons.calendar_month,
                                    size: 40,
                                  ),
                                  title: CustomText(
                                    text: "My Project",
                                    size: 20,
                                  ),
                                  subtitle: CustomText(
                                    text: '',
                                    color: Colors.grey,
                                    size: 20,
                                    weight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
            ])));
  }
}
