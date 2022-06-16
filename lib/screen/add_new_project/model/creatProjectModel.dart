import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';

class CreateProjectModel {
  String? projectName;
  AllUser? projectManager;
  List<String>? member;

  CreateProjectModel({this.projectName, this.projectManager, this.member});

  CreateProjectModel.fromJson(Map<String, dynamic> json) {
    projectName = json['projectName'];
    projectManager = json['projectManager'] != null
        ? AllUser.fromJson(json['projectManager'])
        : null;
    member = json['member'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['projectName'] = this.projectName;
    if (this.projectManager != null) {
      data['projectManager'] = this.projectManager!.toJson();
    }
    data['member'] = this.member;
    return data;
  }
}
