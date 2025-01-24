import 'package:dio/dio.dart';
import 'package:dio_pract/feature/profile/model/profile_model.dart';
class ProfileData {
  Dio dio = Dio();
  getData() async {
    var response = await dio.post('https://elwekala.onrender.com/user/profile',
        data: {"token":"r99altrwdzm692z4wh"}
       );
    try {
      var repoData = response.data;
      var user = UserProfile.fromjson(repoData);
     
      return user;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}
