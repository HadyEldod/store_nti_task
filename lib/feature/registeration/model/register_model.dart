import 'package:dio/dio.dart';

class AuthData {
  final Dio dio = Dio();

  postData({
    required name,
    required email,
    required phone,
    required nationalId,
    required gender,
    required password,
    required profileImage,
  }) async {
    var response =
        await dio.post('https://elwekala.onrender.com/user/register', data: {
      "name": name,
      "email": email,
      "phone": phone,
      "nationalId": nationalId,
      "gender": gender,
      "password": password,
      "profileImage": profileImage
    });
    try {
      var data = response.data;
      // ignore: avoid_print
      print(response.statusCode);
      // ignore: avoid_print
      print("=======================================");
      // ignore: avoid_print
      print(data['message']);
      // ignore: avoid_print
      print("=======================================");
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        // ignore: avoid_print
        print(error.response!.data['message']);
        return error.response!.data;
      }
    }
  }

  // Login function
  login({required String name, required String password}) async {
    var response =
        await dio.post('https://elwekala.onrender.com/user/login', data: {
      "name": name,
      "password": password,
    });
    try {
      var data = response.data;
      
      //var newToken = data['user']['token'];
      //CacheShared.shared!.setString('token', newToken);
      // ignore: avoid_print
      print(response.statusCode);
      // ignore: avoid_print
      print("=======================================");
      // ignore: avoid_print
      print(data['message']);
      // ignore: avoid_print
      print("=======================================");
      return data;
    } on DioException catch (error) {
      if (error.response != null) {
        // ignore: avoid_print
        print(error.response!.data['message']);
        return error.response!.data;
      }
    }
  }
}
