import 'package:day_offf_app/screen/all_project/controller/ProjectController.dart';
import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/screen/all_user/controller/AllUserController.dart';
import 'package:day_offf_app/screen/calender/TableCalendar.dart';
import 'package:day_offf_app/screen/genaral/Controller/ProfileController.dart';
import 'package:day_offf_app/screen/my_request/controller/my_request_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/values/app_colors.dart';
import '../Genaral/profile_screen.dart';
import '../request_tab/request_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  Widget calender = TableEventsExample();
  Widget request = RequestTabScreen();
  Widget profile = ProfileScreen();
  int selectedIndex = 0;
  AllRequestController allRequestController= Get.put(AllRequestController());
  AllUserController allUserController = Get.put(AllUserController());
  ProjectController projectController = Get.put(ProjectController());
  MyRequestController myRequestController= Get.put(MyRequestController());
  ProfileController profileController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: getBody(selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.amaranth,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calender',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'Request',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.generating_tokens),
              label: 'General',
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      );
  }

  Widget getBody(int selectedIndex) {
    if (selectedIndex == 0)  {
      allRequestController.onInit();
      return calender;
    } else if (selectedIndex == 1) {
      myRequestController.onInit();
      return request;
    } else {

        allRequestController.onInit();
        allUserController.onInit();
        projectController.onInit();
        return profile;
  }
  }
}
