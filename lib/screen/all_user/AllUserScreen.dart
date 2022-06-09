
import 'package:day_offf_app/screen/all_user/DetailUser.dart';
import 'package:day_offf_app/screen/all_user/controller/AllUserController.dart';
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AllScreen extends StatefulWidget {
  @override
  State<AllScreen> createState() => _AllScreenState();
}
class _AllScreenState extends State<AllScreen> {
  AllUserController controller =Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
      ),
      body: Center(

              child:Obx(()=> ListView.builder(
                  itemCount: controller.futureStudent.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        isThreeLine: true,
                        leading: const Icon(Icons.account_circle,size: 40,),
                        title: CustomText( text: '${controller.futureStudent[index].fullName}',),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            CustomText(
                            text: 'Username: ${controller.futureStudent[index].username}',
                            color: Colors.grey,
                          ), CustomText(
                              text: 'Level : ${controller.futureStudent[index].level}',
                              color: Colors.grey,
                            ),
                        ]
                        ),
                        trailing: CustomText(text:"${controller.futureStudent[index].roles}"),
                        onTap:(){
                          Get.to(DetailUser(user: controller.futureStudent[index],));
                        },
                      ),
                    );
                  }
              )
    )
    ));


  }
}
