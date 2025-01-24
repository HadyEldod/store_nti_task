import 'package:dio/dio.dart';

import 'laptop_model.dart';

class LaptopData {
  static final Dio dio = Dio();
  static getAllData() async {
    var response =
        await dio.get('https://elwekala.onrender.com/product/Laptops');

    try {
      if (response.statusCode == 200) {
        List responseData = response.data['product'];
        List<LaptopModel> modelList = responseData
            .map(
              (e) => LaptopModel.fromjson(e),
            )
            .toList();
        return modelList;
      }
    } on DioException catch (error) {
      if (error.response != null) {
        return error.response!.data;
      }
    }
  }
}