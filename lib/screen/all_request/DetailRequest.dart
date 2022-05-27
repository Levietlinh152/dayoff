import 'package:day_offf_app/screen/all_request/controller/updateRequestController.dart';
import 'package:day_offf_app/screen/all_request/service/AllRequestService.dart';
import 'package:day_offf_app/screen/calender/untils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:get/get.dart';
import '../../common/values/app_colors.dart';
import '../../constants/app_url.dart';
import '../../widget/custom_text.dart';
import 'model/RequestModel.dart';

class DetailRequest extends StatefulWidget {
  DetailRequest({required this.request});
  AllRequestModel request;

  @override
  State<DetailRequest> createState() => _DetailRequestState();
}
UpdateRequestController updateRequestController = Get.put(UpdateRequestController());

class _DetailRequestState extends State<DetailRequest> {
  final _listStateText = ["REQUESTED", "APPROVED"];
  var _tabTextIconIndexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(AppUrl.avatar_url),
              ),
              title: CustomText(
                text: '${widget.request.user?.nickName}',
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
              trailing:
                _buildState()
            ),

            Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: CustomText(
                  text: 'Reason:${widget.request.reason}',
                  color: Colors.grey[500],
                ))
          ],
        ));
  }
 _buildState(){
    return  FlutterToggleTab(
      width: 40,
      height: 30,
      borderRadius: 10,
      selectedBackgroundColors: const [AppColors.success],
      unSelectedBackgroundColors: const [Colors.grey],
      selectedTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600),
      unSelectedTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 10,
          fontWeight: FontWeight.w400),
      labels: _listStateText,
      selectedIndex: _tabTextIconIndexSelected,
      selectedLabelIndex: (index) {
        setState(() {
          _tabTextIconIndexSelected = index;
          print(_tabTextIconIndexSelected);
          if(_tabTextIconIndexSelected==0){
            updateRequestController.updateRequest("REQUESTED", widget.request.sId!);
          }
          else{
            updateRequestController.updateRequest("APPROVED", widget.request.sId!);
          }
        });
      },
    );
 }
}
