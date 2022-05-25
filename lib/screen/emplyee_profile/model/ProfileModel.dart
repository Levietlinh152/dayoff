
class ProfileModelRequest {
  String? fullName;
  String? nickName;
  String? email;
  String? roles;
  String? citizenID;
  String? level;
  String? dateOfBirth;

  ProfileModelRequest(
      {this.fullName,
        this.nickName,
        this.email,
        this.roles,
        this.citizenID,
        this.level,
        this.dateOfBirth});

  ProfileModelRequest.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    nickName = json['nickName'];
    email = json['email'];
    roles = json['roles'];
    citizenID = json['citizenID'];
    level = json['level'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['nickName'] = this.nickName;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['citizenID'] = this.citizenID;
    data['level'] = this.level;
    data['dateOfBirth'] = this.dateOfBirth;
    return data;
  }
}

