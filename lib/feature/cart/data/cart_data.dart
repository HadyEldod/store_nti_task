import 'package:dio/dio.dart';

import 'cart_model.dart';

class CartData {
  final Dio dio = Dio();
  addToCard() async {
    var response =
        await dio.post('https://elwekala.onrender.com/cart/add', data: {
      "productId": "64666de091c71d884185b778",
      "nationalId": "30209011219366",
      "quantity": "1",
    });
    var data = response.data;
    return data;
  }

  getAllCart() async {
    var response =
        await dio.get('https://elwekala.onrender.com/cart/allProducts', data: {
      "nationalId": '37776456788746',
    });

    try {
      if (response.statusCode == 200) {
        List dataRepo = response.data["products"];
        List<CartModel> listcart =
            dataRepo.map((e) => CartModel.fromJson(e)).toList();
        return listcart;
      }
    } on DioException catch (error) {
      if (error.response != null) {
        //print(error.response!.data['message']);
        return error.response!.data;
      }
    }
  }

  deleteCart({required String productId}) async {
    var response = await dio.delete("https://elwekala.onrender.com/cart/delete",
        data: {
          "nationalId": '37776456788746',
          "productId": productId,
          "quantity": "1"
        });

    var data = response.data;
    return data;
  }

  updateCart({required String productId,required quantity})async{
    var response = await dio.delete("https://elwekala.onrender.com/cart",
        data: {
          "nationalId": '37776456788746',
          "productId": productId,
          "quantity": quantity
        });
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
