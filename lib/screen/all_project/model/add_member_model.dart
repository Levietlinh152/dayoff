class AddMemberModel {
  List<String>? member;

  AddMemberModel({this.member});

  AddMemberModel.fromJson(Map<String, dynamic> json) {
    member = json['member'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['member'] = this.member;
    return data;
  }
}
