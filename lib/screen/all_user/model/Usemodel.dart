class AllUser {
  String? sId;
  String? level;
  int? timeOffRemaining;
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
    dateCreated = json['dateCreated'];
    roles = json['roles'];
    citizenID = json['citizenID'];
    email = json['email'] as String;
    nickName = json['nickName'];
    fullName = json['fullName'];
    username = json['username'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['level'] = this.level;
    data['timeOffRemaining'] = this.timeOffRemaining;
    data['dateCreated'] = this.dateCreated;
    data['roles'] = this.roles;
    data['citizenID'] = this.citizenID;
    data['email'] = this.email;
    data['nickName'] = this.nickName;
    data['fullName'] = this.fullName;
    data['username'] = this.username;
    data['__v'] = this.iV;
    return data;
  }
}
