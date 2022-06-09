import 'package:day_offf_app/screen/all_user/model/Usemodel.dart';

class Project {
  String? sId;
  bool? isDeleted;
  String? startDate;
  String? state;
  List<AllUser>? member;
  AllUser? projectManager;
  String? projectName;
  int? iV;

  Project(
      {this.sId,
      this.isDeleted,
      this.startDate,
      this.state,
      this.member,
      this.projectManager,
      this.projectName,
      this.iV});

  Project.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isDeleted = json['isDeleted'];
    startDate = json['startDate'];
    state = json['state'];
    if (json['member'] != null) {
      member = <AllUser>[];
      json['member'].forEach((v) {
        member!.add(AllUser.fromJson(v));
      });
    }
    projectManager = json['projectManager'] != null
        ? AllUser.fromJson(json['projectManager'])
        : null;
    projectName = json['projectName'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['isDeleted'] = isDeleted;
    data['startDate'] = startDate;
    data['state'] = state;
    if (member != null) {
      data['member'] = member!.map((v) => v.toJson()).toList();
    }
    if (projectManager != null) {
      data['projectManager'] = projectManager!.toJson();
    }
    data['projectName'] = projectName;
    data['__v'] = iV;
    return data;
  }
}

