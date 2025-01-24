import 'package:dio/dio.dart';

import '../../../core/model/category_model.dart';

class CategoryData {
  static Dio dio = Dio();
  Future<List<CategoryModel>> getData({required final String endpoint}) async {
    var response =
        await dio.get('https://fakestoreapi.com/products/category/$endpoint');
    if (response.statusCode == 200) {
      List data = response.data;
      List<CategoryModel> categoryList =
          data.map((e) => CategoryModel.fromjson(e)).toList();
      return categoryList;
    } else {
      throw Exception('failed to load data');
    }
  }
}