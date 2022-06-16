import 'package:day_offf_app/screen/all_user/controller/AllUserController.dart';
import 'package:day_offf_app/screen/all_user/controller/DeleteUserController.dart';
import 'package:day_offf_app/screen/all_user/controller/EditController.dart';
import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';
import 'package:day_offf_app/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';

import '../../common/values/app_colors.dart';
import '../../constants/app_url.dart';
import '../../widget/custom_text.dart';
import '../../widget/rounded_input_field.dart';

class DetailUser extends StatefulWidget {
  DetailUser({required this.user});
  late AllUser user;

  @override
  State<DetailUser> createState() => _DetailUserState();
}

class _DetailUserState extends State<DetailUser> {
  AllUserController allUserController = Get.find();
  EditUserController editUserController = Get.put(EditUserController());
  TextEditingController dateController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController citizenIdController = TextEditingController();
  TextEditingController levelController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  DeleteUserController controller = Get.put(DeleteUserController());

  late String rolesValue;
  late String levelValue = "INTERN";

  bool _isShown = true;
  void _deleteState(
      BuildContext context, Function onConfirm, Function onCancel) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to delete this user'),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    setState(() {
                      _isShown = false;
                      onConfirm();
                    });
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                    onCancel();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }

  @override
  void initState() {
    rolesValue = widget.user.roles.toString();
    levelValue = widget.user.level.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    editUserController.updateUserModel.value = widget.user;
    return Scaffold(
        appBar: _appbar(),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20,0),
            child: ListView(
              children: [
                Stack(children:  [
                  const Center(
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(AppUrl.avatar_url),
                        radius: 90,
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(200, 0, 0, 10),
                    child: RawMaterialButton(
                        onPressed: () {},
                        elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                          Icons.edit,
                          color: Colors.lightBlue[900],
                          size: 30,

                        ),
                      padding: const EdgeInsets.all(8.0),
                      shape: const CircleBorder(),
                    ),
                  )
                ]),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: RoundedInputField(
                    textfielController: fullnameController
                      ..text = editUserController.updateUserModel.value.fullName
                          .toString(),
                    hintText: "fullName",
                    onChanged: (value) {},
                  ),
                ),
                RoundedInputField(
                    textfielController: nicknameController
                      ..text = editUserController.updateUserModel.value.nickName
                          .toString(),
                    hintText: "nickName",
                    onChanged: (value) {},
                    icon: Icons.drive_file_rename_outline),
                RoundedInputField(
                  textfielController: emailController
                    ..text = editUserController.updateUserModel.value.email
                        .toString(),
                  hintText: "email",
                  icon: Icons.email,
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  textfielController: citizenIdController
                    ..text = editUserController.updateUserModel.value.citizenID
                        .toString(),
                  hintText: "cityzenId",
                  onChanged: (value) {},
                  icon: Icons.location_city,
                ),
                Container(
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
                        Icons.leak_add,
                        color: AppColors.kPrimaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: DropdownButton<String>(
                          value: rolesValue,
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
                      ),
                    ],
                  ),
                ),
                Container(
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
                        Icons.leak_add,
                        color: AppColors.kPrimaryColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: DropdownButton<String>(
                          value: levelValue,
                          elevation: 16,
                          style: const TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              levelValue = newValue!;
                            });
                          },
                          items: <String>[
                            'INTERN',
                            'FRESHER',
                            'JUNIOR',
                            'MIDDLE',
                            'SENIOR'
                          ].map<DropdownMenuItem<String>>((String value) {
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
                RoundedInputField(
                  textfielController: dateController
                    ..text = editUserController
                        .updateUserModel.value.dateOfBirth
                        .toString()
                        .substring(0, 10),
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900, 3, 5),
                        maxTime: DateTime.now(),
                        onChanged: (date) {}, onConfirm: (date) {
                      dateController.text = date.toString().substring(0, 10);
                    }, currentTime: DateTime.now(), locale: LocaleType.vi);
                  },
                  hintText: "date of birth",
                  icon: Icons.house_siding_rounded,
                  onChanged: (value) {},
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: RoundedButton(
                      text: 'SUBMIT',
                      press: () {
                        AllUser allUser = AllUser(
                            fullName: fullnameController.text,
                            nickName: nicknameController.text,
                            email: emailController.text,
                            citizenID: citizenIdController.text,
                            roles: rolesValue,
                            level: levelValue,
                            dateOfBirth: dateController.text);

                        editUserController.upDateUser(
                            widget.user.sId.toString(), allUser);
                      }),
                )
              ],
            ),
          ),
        ));
  }

  _appbar() {
    return AppBar(
      title: const CustomText(text: ""),
      actions: [
        InkWell(
          onTap: _isShown == true
              ? () => _deleteState(context, () async {
                   controller.deleteUser(widget.user.sId!);
                  }, () {})
              : null,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
