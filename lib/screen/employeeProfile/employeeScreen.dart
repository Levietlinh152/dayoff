
import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/employeeProfile/controller/update_employee_controller.dart';
import 'package:day_offf_app/screen/genaral/Controller/ProfileController.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../constants/app_url.dart';
import '../../widget/rounded_input_field.dart';

class EmployeeScreen extends StatefulWidget {

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  UpdateEmployeeController controller = Get.put(UpdateEmployeeController());
  ProfileController profileController= Get.find();

  TextEditingController dateController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController citizenIdController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
              () => ListView(
            children: [
              Stack(children: [
                Container(
                  height: Get.height * 0.3,
                  width: Get.width,
                  decoration: const BoxDecoration(
                  ),
                ),
                Positioned(
                  top: Get.height * 0.15 - 90,
                  left: Get.width / 2 - 80,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(AppUrl.avatar_url),
                    radius: 90,
                  ),
                ),
                Positioned(
                    bottom: Get.height * 0.15 - 90,
                    right: Get.width / 2 - 110,
                    child: RawMaterialButton(
                      onPressed: () {},
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        Icons.edit,
                        color: Colors.lightBlue[900],
                        size: 30,
                      ),
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                    )),
              ]),
              RoundedInputField(
                textfielController: fullnameController
                  ..text = profileController.user.value.fullName
                      .toString(),
                hintText: "fullName",
                onChanged: (value) {},
              ),
              RoundedInputField(
                  textfielController: nicknameController
                    ..text =profileController.user.value.nickName
                        .toString(),
                  hintText: "nickName",
                  onChanged: (value) {},
                  icon: Icons.drive_file_rename_outline),
              RoundedInputField(
                textfielController: emailController
                  ..text =
                  profileController.user.value.email.toString(),
                hintText: "email",
                icon: Icons.email,
                onChanged: (value) {},
              ),
              RoundedInputField(
                textfielController: citizenIdController
                  ..text = profileController.user.value.citizenID
                      .toString(),
                hintText: "cityzenId",
                onChanged: (value) {},
                icon: Icons.location_city,
              ),

              RoundedInputField(
                textfielController: dateController
                  ..text = profileController.user.value.dateOfBirth
                      .toString()
                      .substring(0, 10),
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1900, 3, 5),
                      maxTime: DateTime(2050, 6, 7),
                      onChanged: (date) {}, onConfirm: (date) {
                        dateController.text = date.toString().substring(0, 10);
                      }, currentTime: DateTime.now(), locale: LocaleType.vi);
                },
                hintText: "date of birth",
                icon: Icons.house_siding_rounded,
                onChanged: (value) {},
              ),
              RoundedButton(
                  text: 'SUBMIT',
                  press: ()  {
                    AllUser allUser =  AllUser(
                        fullName: fullnameController.text,
                        nickName: nicknameController.text,
                        email: emailController.text,
                        citizenID: citizenIdController.text,
                        dateOfBirth: dateController.text);
                       controller.upDateUser(profileController.user.value.sId!, allUser);

                  })
            ],
          ),
        ));
  }

}
