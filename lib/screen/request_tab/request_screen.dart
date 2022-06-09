import 'package:day_offf_app/screen/my_request/my_request.dart';
import 'package:day_offf_app/screen/pending_request/pending_request.dart';
import 'package:flutter/material.dart';

class RequestTabScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:const  Size.fromHeight(60.0),
          child: AppBar(
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: "MY REQUEST",
                ),
                Tab(
                  text: "PENDING REQUEST",
                ),
              ],
            ),
          ),
        ),
        body:  TabBarView(
          children: [
            MyRequestScreen(),
            PendingRequestScreen()
          ],
        ),
      ),
    );
  }
}
