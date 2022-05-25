

import 'package:day_offf_app/screen/all_user/DetailUser.dart';
import 'package:day_offf_app/screen/all_user/service/AllService.dart';
import 'package:day_offf_app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AllScreen extends StatefulWidget {
  @override
  State<AllScreen> createState() => _AllScreenState();
}
class _AllScreenState extends State<AllScreen> {
  late Future<List> futureStudent=AllService().fetchPost();
  bool _isShown = true;
  void _delete(BuildContext context,Function onConfirm,Function onCancel) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove this user?'),
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List User'),
        ),
        body: Center(
          child: FutureBuilder(
            future: futureStudent,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: const Icon(Icons.account_circle,size: 40,),
                          title: CustomText( text: '${snapshot.data[index].fullName}',),
                          subtitle: CustomText(
                            text: '${snapshot.data[index].username}',
                            color: Colors.grey,
                          ),
                          trailing: InkWell(
                            onTap:
                            _isShown==true ? ()=>_delete(context,
                                    (){
                                  AllService().deleteUser(snapshot.data[index].sId);
                                  futureStudent= AllService().fetchPost();
                                },
                                    (){}):null
                              ,
                              child: const Icon(Icons.delete)),
                          onTap:(){
                            Get.to(DetailUser(user: snapshot.data[index],));
                          },

                        ),
                      );
                    }
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      );
  }
}

