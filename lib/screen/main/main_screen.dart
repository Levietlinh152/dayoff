import 'package:day_offf_app/screen/balance/balance_screen.dart';
import 'package:day_offf_app/screen/calender/TableCalendar.dart';
import 'package:flutter/material.dart';

import '../../common/values/app_colors.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget calender = TableEventsExample();
  Widget balance = BalanceScreen();
  Widget profile = ProfileScreen();
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              label: 'Balance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Profile',
            ),
          ],
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget getBody(int selectedIndex) {
    if (selectedIndex == 0) {
      return calender;
    } else if (selectedIndex == 1) {
      return balance;
    } else {
      return profile;
    }
  }
}
