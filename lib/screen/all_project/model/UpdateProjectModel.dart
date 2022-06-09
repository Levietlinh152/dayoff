class UpdateProjectModel {
  String? projectName;
  String? projectManager;
  String? state;

  UpdateProjectModel({this.projectName, this.projectManager, this.state});

  UpdateProjectModel.fromJson(Map<String, dynamic> json) {
    projectName = json['projectName'];
    projectManager = json['projectManager'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['projectName'] = this.projectName;
    data['projectManager'] = this.projectManager;
    data['state'] = this.state;
    return data;
  }
}
