import 'package:day_offf_app/common/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HolidayScreen extends StatelessWidget {
  final List<String> entries = <String>['international new year day', 'new year day', 'Tet holiday'];
  final List<String> days = <String>['Th7 01 thg 1 2022', 'CN 02 thg 1 2022', 'th2 31 thg 1 2022'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.height/12,
        title: Text('Official Holiday'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: entries.length ,
            itemBuilder: (BuildContext context,int index){
            return Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: AppColors.border),
                  ),
                ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(entries[index].toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20, color: AppColors.black,
                    ),),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined,color: AppColors.amaranth,size: 15,),
                      Text(days[index],
                      style: GoogleFonts.lato(fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color:AppColors.amaranth),)
                    ],
                  )
                ],
              ),
            );
        }),
      ),
    );
  }
}
