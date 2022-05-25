class LoginResponseModel {
  final String token;
  final String user_id;

  LoginResponseModel({required this.token, required this.user_id});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["access_token"] != null ? json["access_token"] : "",
      user_id: json["user_id"] != null ? json["user_id"]:"",
    );
  }
}

class LoginRequestModel {
  String? username;
  String? password;

  LoginRequestModel({this.username, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
