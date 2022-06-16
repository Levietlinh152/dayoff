class UpdatePasswordModel {
  String? fullName;
  String? nickName;
  String? email;
  String? roles;
  String? citizenID;
  String? address;
  String? level;
  String? dateOfBirth;
  String? password;

  UpdatePasswordModel(
      {this.fullName,
        this.nickName,
        this.email,
        this.roles,
        this.citizenID,
        this.address,
        this.level,
        this.dateOfBirth,
        this.password});

  UpdatePasswordModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    nickName = json['nickName'];
    email = json['email'];
    roles = json['roles'];
    citizenID = json['citizenID'];
    address = json['address'];
    level = json['level'];
    dateOfBirth = json['dateOfBirth'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['nickName'] = this.nickName;
    data['email'] = this.email;
    data['roles'] = this.roles;
    data['citizenID'] = this.citizenID;
    data['address'] = this.address;
    data['level'] = this.level;
    data['dateOfBirth'] = this.dateOfBirth;
    data['password'] = this.password;
    return data;
  }
}
