import 'package:dio/dio.dart';
import '../model/Usemodel.dart';

class AllService {
  var dio = Dio();
  String url = "http://66.42.56.32:3000/users/get-all-users";
  List<AllUser> listUser = <AllUser>[];

  Future<List<AllUser>> fetchPost() async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      // final List<dynamic> list = json.decode(response.data);
      listUser =
      List<AllUser>.from(response.data.map((e) => AllUser.fromJson(e)));
      return listUser;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Response> deleteUser(String id) async {
    final response =
    await dio.delete('http://66.42.56.32:3000/users/delete/$id');
    return response;
  }
}