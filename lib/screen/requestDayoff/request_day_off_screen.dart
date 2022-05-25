
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import '../../widget/rounded_button.dart';
import 'controller/RequestController.dart';

List<String> level =['INTERN','SENIOR','PM'];
class RequestScreenDayOff extends StatelessWidget {
  final RequestController requestController = Get.put(RequestController());

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    print(picked);
    if (picked != null && picked != requestController.selectedStartDate) {
      requestController.selectedStartDate.value = picked;
    }
  }
  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    print(picked);
    if (picked != null && picked != requestController.selectedEndDate) {
      requestController.selectedEndDate.value = picked;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Material(
            child: Container(
              child: ListView(
                children: <Widget>[
                  Stack(children: [
                    Container(
                      height: Get.height * 0.3,
                      width: Get.width,
                      decoration: const BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          image: DecorationImage(
                            image: AssetImage('assets/images/webInterFace.png'),
                            fit: BoxFit.fill,
                          )),
                    ),
                    Positioned(
                      top: Get.height / 7,
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
                  const SizedBox(height: 20),
                  Container(
                    width: Get.width * 0.9,
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Container(
                              width: Get.width * 0.9,
                              height: Get.height / 12,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text('Schedule',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 20)),
                                  RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        const TextSpan(
                                            text: '0/12',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.black)),
                                        TextSpan(
                                            text: ' Days/Year!',
                                            style: TextStyle(
                                                color: Colors.grey[400],
                                                fontSize: 16)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                        const SizedBox(height: 20),
                        Row(
                          // DATE TIME PICKER
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                _selectStartDate(context);
                              },
                              child: Container(
                                width: Get.width * 0.4,
                                height: Get.height/12,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Colors.redAccent,
                                        ),
                                        Text(
                                          'Start',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                    Obx(()=>Text(
                                      requestController.selectedStartDate.value.toString().split(' ')[0],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 20),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _selectEndDate(context);
                              },
                              child: Container(
                                width: Get.width * 0.4,
                                height: Get.height / 12,
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Colors.redAccent,
                                        ),
                                        Text(
                                          'End',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        )
                                      ],
                                    ),
                                    Obx(()=>Text(
                                      requestController.selectedEndDate.value.toString().split(' ')[0],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontSize: 20),
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                            alignment: Alignment.center,
                            width: Get.width * 0.9,
                            height: Get.height / 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[350],
                            ),
                            child: const Text(
                              'Comp off request is for 1 day',
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        const SizedBox(height: 20),
                       Container(
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                RoundCheckBox(
                                  onTap: (selected) {
                                    requestController.isMorning=true;
                                  },
                                  size: 15,
                                  uncheckedColor: Colors.white60,
                                  isChecked: false,
                                ),
                                CustomText(text: "Is Morning",color: Colors.grey,),
                              ],
                            ),
                            Container(
                              child:
                              Row(
                                children: [
                                  RoundCheckBox(
                                    onTap: (selected) {
                                      requestController.isMultipleDay=true;
                                    },
                                    size: 15,
                                    uncheckedColor: Colors.white60,
                                    isChecked: false,
                                  ),
                                  CustomText(text: "Is MultipleDay",color: Colors.grey,)
                                ],
                              ),
                            ),
                          ],
                        ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width * 0.9,
                            height: Get.height / 8,
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
                            child:  TextField(
                              controller: requestController.reasonController,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  labelText: 'Reason',
                                  labelStyle: TextStyle(fontSize: 20),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: RoundedButton(
                      text: "SUBMIT",
                      press: () {
                        requestController.requestDayoff();
                        // Get.toNamed(Routes.main);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
