import 'package:day_offf_app/screen/balance_tab/balance_tab_screen.dart';
import 'package:day_offf_app/screen/request/RequestScreen.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicator: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: 'Requests'),
              Tab(
                text: 'Balance',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [RequestScreen(), BalanceTabScreen()],
        ),
      ),
    );
  }
}
