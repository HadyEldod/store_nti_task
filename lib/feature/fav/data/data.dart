import 'package:dio/dio.dart';

import '../model/fav_model.dart';

class FavData {
  static Dio dio = Dio();

  static addFav() async {
    var response =
        await dio.post('https://elwekala.onrender.com/favorite', data: {
      "nationalId": "01056710052789",
    });
    var resposeData = response.data;
    return resposeData;
  }

  static getAllFav() async {
    var response = await dio.get('https://elwekala.onrender.com/favorite',
        data: {"nationalId": "01056710052789"});
    try {
      List responseData = response.data['favoriteProducts'];
      List<FavModel> favList = responseData
          .map(
            (e) => FavModel.fromjson(e),
          )
          .toList();

      return favList;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }

  static deleteAllFav({required String productId}) async {
    var response = await dio.delete('https://elwekala.onrender.com/favorite',
        data: {"nationalId": "01056710052789", "productId": productId});
    try {
      var responseData = response.data;
      return responseData;
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }

  }
}
