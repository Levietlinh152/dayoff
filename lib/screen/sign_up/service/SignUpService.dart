
import 'package:day_offf_app/screen/sign_up/model/SignUpModel.dart';
import 'package:dio/dio.dart';

class SignUpService {
  var dio = Dio();

  Future<void> signUp(SignUpModel signUpModel) async {
    String url = "http://66.42.56.32:3000/users/sign-up";
    try {
      final response = await dio.post(url, data: signUpModel.toJson());
      print(response.statusCode);
      print(response.data);
        if (response.statusCode == 200 || response.statusCode == 201) {
        print('successes');
      }
    }
    catch(Exception) {
      print(Exception);

    }
  }
}