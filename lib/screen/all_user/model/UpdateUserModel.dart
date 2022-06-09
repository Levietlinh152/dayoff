import 'package:json_annotation/json_annotation.dart';
part '';
class UpdateUserModel {
  String? fullName;
  String? nickName;
  String? email;
  String? roles;
  String? citizenID;
  String? level;
  DateTime? dateOfBirth;

  UpdateUserModel(
      {this.fullName,
      this.nickName,
      this.email,
      this.roles,
      this.citizenID,
      this.level,
      this.dateOfBirth});

  UpdateUserModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    nickName = json['nickName'];
    email = json['email'];
    roles = json['roles'];
    citizenID = json['citizenID'];
    level = json['level'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['nickName'] = nickName;
    data['email'] = email;
    data['roles'] = roles;
    data['citizenID'] = citizenID;
    data['level'] = level;
    data['dateOfBirth'] = dateOfBirth?.toIso8601String();
    return data;
  }
}
