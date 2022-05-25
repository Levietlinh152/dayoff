import 'package:day_offf_app/screen/sign_up/model/roles_enum.dart';

class SignUpModel {
 late String fullName;
 late String nickName;
 late String email;
  String? roles;
  String? citizenID;
  String? level;
  DateTime? dateOfBirth;
  late String username;
  late String password;

  SignUpModel(
      { required this.fullName,
        required this.nickName,
        required this.email,
        this.roles,
        this.citizenID,
        this.level,
        this.dateOfBirth,
        required this.username,
        required this.password
      });

  SignUpModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    nickName = json['nickName'];
    email = json['email'];
    roles = json['roles'];
    citizenID = json['citizenID'];
    level = json['level'];
    dateOfBirth = json['dateOfBirth'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['nickName'] = this.nickName;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['citizenID'] = this.citizenID;
    data['level'] = this.level;
    data['dateOfBirth'] = this.dateOfBirth?.toIso8601String();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
