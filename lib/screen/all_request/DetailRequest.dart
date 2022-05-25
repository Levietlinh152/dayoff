import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/values/app_colors.dart';
import '../../constants/app_url.dart';
import '../../widget/custom_text.dart';
import 'model/RequestModel.dart';
// ignore: must_be_immutable
class DetailRequest extends StatefulWidget {
  DetailRequest({required this.request});
  AllRequestModel request;

  @override
  State<DetailRequest> createState() => _DetailRequestState();
}

class _DetailRequestState extends State<DetailRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
                 Column(
                  children: [
                 Container(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(AppUrl.avatar_url),
                      ),
                      title: CustomText(
                        text:
                        '${widget.request.user?.nickName}',
                        size: 20,
                        color: AppColors.black,
                        weight: FontWeight.bold,
                      ),
                      subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: AppColors.doveGray,
                                ),
                                CustomText(
                                  text: widget.request.fromDay
                                      .toString()
                                      .substring(0, 10),
                                  color: AppColors.doveGray,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: AppColors.doveGray,
                                ),
                                CustomText(
                                  text: widget.request.toDay
                                      .toString()
                                      .substring(0, 10),
                                  color: AppColors.doveGray,
                                ),
                              ],
                            ),
                          ]),
                      trailing: InkWell(
                        onTap: (){

                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.amaranth,
                                borderRadius: BorderRadius.circular(5)),
                            child: CustomText(
                              text:
                              ' ${widget.request.state} ',
                              color: Colors.white,
                            )),
                      ),
                    ),
                    // Text("Id :"+ snapshot.data[index].id + snapshot.data[index].name + snapshot.data[index].lop )
                  ),
                ]),

              const CustomText(text: 'Reason',color: Colors.grey,),
              CustomText(text: '${widget.request.reason}',color: Colors.grey[500],)
            ],
          ),
        ));
  }
}
