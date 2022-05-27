class AllRequestModel {
  String? sId;
  User? user;
  String? state;
  String? toDay;
  String? reason;
  String? fromDay;
  String? createdDate;
  bool? isMultipleDay;
  bool? isMorning;
  int? iV;

  AllRequestModel(
      {this.sId,
      this.user,
      this.state,
      this.toDay,
      this.reason,
      this.fromDay,
      this.createdDate,
      this.isMultipleDay,
      this.isMorning,
      this.iV});

  AllRequestModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    state = json['state'];
    toDay = json['toDay'];
    reason = json['reason'];
    fromDay = json['fromDay'];
    createdDate = json['createdDate'];
    isMultipleDay = json['isMultipleDay'];
    isMorning = json['isMorning'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['state'] = state;
    data['toDay'] = toDay;
    data['reason'] = reason;
    data['fromDay'] = fromDay;
    data['createdDate'] = createdDate;
    data['isMultipleDay'] = isMultipleDay;
    data['isMorning'] = isMorning;
    data['__v'] = iV;
    return data;
  }
}

class User {
  String? sId;
  String? nickName;

  User({this.sId, this.nickName});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    nickName = json['nickName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = sId;
    data['nickName'] = nickName;
    return data;
  }
}
