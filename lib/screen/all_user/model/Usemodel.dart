class AllUser {
  String? sId;
  String? level;
  int? timeOffRemaining;
  String? dateOfBirth;
  String? dateCreated;
  String? roles;
  String? citizenID;
  String? email;
  String? nickName;
  String? fullName;
  String? username;
  int? iV;

  AllUser(
      {this.sId,
      this.level,
      this.timeOffRemaining,
      this.dateOfBirth,
      this.dateCreated,
      this.roles,
      this.citizenID,
      this.email,
      this.nickName,
      this.fullName,
      this.username,
      this.iV});

  AllUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    level = json['level'];
    timeOffRemaining = json['timeOffRemaining'];
    dateOfBirth = json['dateOfBirth'];
    dateCreated = json['dateCreated'];
    roles = json['roles'];
    citizenID = json['citizenID'];
    email = json['email'];
    nickName = json['nickName'];
    fullName = json['fullName'];
    username = json['username'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['level'] = level;
    data['timeOffRemaining'] = timeOffRemaining;
    data['dateOfBirth'] = dateOfBirth;
    data['dateCreated'] = dateCreated;
    data['roles'] = roles;
    data['citizenID'] = citizenID;
    data['email'] = email;
    data['nickName'] = nickName;
    data["fullName"] = fullName;
    data['username'] = username;
    data['__v'] = iV;
    return data;
  }
}
