import 'package:day_offf_app/screen/all_user/controller/AllUserController.dart';
import 'package:day_offf_app/screen/all_user/model/UpdateUserModel.dart';
import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/screen/all_user/service/EditService.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../common/values/app_colors.dart';
import '../../constants/app_url.dart';
import '../../widget/rounded_input_field.dart';

class DetailUser extends StatefulWidget {
  DetailUser({required this.user});
  late AllUser user;

  @override
  State<DetailUser> createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  TextEditingController dateController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController citizenIdController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String rolesValue = "USER";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Stack(children: [
            Container(
              height: Get.height * 0.3,
              width: Get.width,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
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
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )),
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.cancel,
                  color: Colors.grey,
                  size: 35,
                ),
              ),
            )
          ]),

          RoundedInputField(
            textfielController: fullnameController
              ..text = widget.user.fullName.toString(),
            hintText: "fullName",
            onChanged: (value) {},
          ),
          RoundedInputField(
              textfielController: nicknameController
                ..text = widget.user.nickName.toString(),
              hintText: "nickName",
              onChanged: (value) {},
              icon: Icons.drive_file_rename_outline),

          RoundedInputField(
            textfielController: emailController
              ..text = widget.user.email.toString(),
            hintText: "email",
            icon: Icons.email,
            onChanged: (value) {},
          ),
          RoundedInputField(
            textfielController:citizenIdController
              ..text = widget.user.citizenID.toString(),
            hintText: "cityzenId",
            onChanged: (value) {},
            icon: Icons.location_city,
          ),
          Container(
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
                  Icons.leak_add,
                  color: AppColors.kPrimaryColor,
                ),
                DropdownButton<String>(
                  value: rolesValue,
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: AppColors.kPrimaryColor,
                  ),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      rolesValue = newValue!;
                    });
                  },
                  items: <String>['USER', 'ADMIN', 'PROJECT_MANAGER']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          RoundedInputField(
            textfielController: dateController..text=widget.user.dateCreated.toString().substring(0,10),
            onTap: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 3, 5),
                  maxTime: DateTime(2050, 6, 7), onChanged: (date) {
                print('change $date');
              }, onConfirm: (date) {
                print('confirm $date');
                dateController.text =
                    date.toString().substring(0, 10);
              }, currentTime: DateTime.now(), locale: LocaleType.vi);
            },
            hintText: "date of birth",
            icon: Icons.house_siding_rounded,
            onChanged: (value) {},
          ),

          RoundedButton(
              text: 'SUBMIT',
              press: () {
                final updateUserModel =  new UpdateUserModel(
                  fullName:  fullnameController.text,
                  nickName: nicknameController.text,
                  email: emailController.text,
                  citizenID: citizenIdController.text,
                  roles: rolesValue,
                  dateOfBirth: DateFormat('yyyy-MM-dd').parse(dateController.text),
                );
                print(updateUserModel.fullName);
                EditUserService().updateEmployee(widget.user.sId, updateUserModel);
                print(widget.user.sId);

              })
        ],
      ),
    );
  }
}
