import 'package:day_offf_app/constants/app_url.dart';
import 'package:day_offf_app/screen/emplyee_profile/controller/ProfileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../widget/rounded_button.dart';
import '../../widget/rounded_input_field.dart';

class EmployeeScreen extends StatelessWidget {
  ProfileController profileController = Get.put(ProfileController());
String cityzen = "cityzen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: ListView(
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
                  top:Get.height*0.15-90,
                  left: Get.width/2-80,
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      AppUrl.avatar_url
                    ),
                    radius: 90,
                  ),
                ),
                Positioned(
                    bottom: Get.height*0.15-90,
                    right: Get.width/2-110 ,
                    child:
                    RawMaterialButton(
                      onPressed: () {
                      },
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedInputField(
                  inputType: TextInputType.emailAddress,
                  textfielController: profileController.emailController,
                  hintText: "email",
                  onChanged: (value) {},
                  icon: Icons.email,

                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedInputField(
                  textfielController: profileController.nicknameController,
                  hintText: "Name".tr,
                  onChanged: (value) {},
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Get.width*0.8,
                  alignment: Alignment.center,
                  child: Container(
                    height: 60,
                    width: Get.width*0.9,
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber value) {},
                      onInputValidated: (bool value) {
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DIALOG,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.grey,),
                      // textFieldController: controller,
                      formatInput: false,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedInputField(
                  textfielController: profileController.citizenIdController,
                  hintText: cityzen,
                  onChanged: (value) {
                    cityzen= profileController.citizenIdController.text;
                  },
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(30.0),
                 child: RoundedButton(
                    text: 'SAVE CHANGES',
                    textSize: 18,
                    textWeight: FontWeight.w700,
                    press: () async {
                      profileController.updateProfile();

                    },
                  ),
               ),
            ],
          ),
        ));
  }
}
