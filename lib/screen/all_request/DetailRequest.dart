import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:day_offf_app/screen/all_request/controller/updateRequestController.dart';
import 'package:day_offf_app/screen/all_request/service/AllRequestService.dart';
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

UpdateRequestController updateRequestController =
    Get.put(UpdateRequestController());

class _DetailRequestState extends State<DetailRequest> {
  final _listStateText = ["REQUESTED", "APPROVED", "REJECT"];
  var _tabTextIconIndexSelected;

  bool _isShown = true;
  AllRequestController allRequestController = Get.find();
  void _deleteState(
      BuildContext context, Function onConfirm, Function onCancel) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to delete this request'),
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
  void initState() {
    _tabTextIconIndexSelected =
        updateRequestController.stateIndex(widget.request.state!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appbar(),
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
                trailing: _buildState()),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: CustomText(
                  text: 'Reason:${widget.request.reason}',
                  color: Colors.grey,
                )),
            Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 10, 0),
                child: CustomText(
                  text:
                      'Time off : ${updateRequestController.state(widget.request.isMorning!, widget.request.isMultipleDay!)}',
                  color: Colors.grey,
                )),
          ],
        ));
  }

  _buildState() {
    return FlutterToggleTab(
      width: 40,
      height: 30,
      borderRadius: 10,
      selectedBackgroundColors: const [AppColors.success],
      unSelectedBackgroundColors: const [Colors.grey],
      selectedTextStyle: const TextStyle(
          color: AppColors.white, fontSize: 8, fontWeight: FontWeight.w600),
      unSelectedTextStyle: const TextStyle(
          color: AppColors.white, fontSize: 8, fontWeight: FontWeight.w400),
      labels: _listStateText,
      selectedIndex: _tabTextIconIndexSelected,
      selectedLabelIndex: (index) {
        setState(() {
          _tabTextIconIndexSelected = index;
          if (_tabTextIconIndexSelected == 0) {
            updateRequestController.updateRequest(
                "REQUESTED", widget.request.sId!);
          } else if (_tabTextIconIndexSelected == 1) {
            updateRequestController.updateRequest(
                "APPROVED", widget.request.sId!);
          } else {
            updateRequestController.updateRequest(
                "REJECTED", widget.request.sId!);
          }
        });
      },
    );
  }

  _appbar() {
    return AppBar(
      title: const CustomText(text: ""),
      actions: [
        InkWell(
          onTap: _isShown == true
              ? () => _deleteState(context, () async {
                    updateRequestController
                        .deleteRequest(widget.request.sId.toString());
                    allRequestController.listRequest.value =
                        await AllRequestDayOffService().fetchRequest();
                  }, () {})
              : null,
          child: const Icon(
            Icons.delete,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}
