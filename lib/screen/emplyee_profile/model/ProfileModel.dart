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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['fullName'] = fullName;
    data['nickName'] = nickName;
    data['email'] = email;
    data['roles'] = roles;
    data['citizenID'] = citizenID;
    data['level'] = level;
    data['dateOfBirth'] = dateOfBirth;
    return data;
  }
}
