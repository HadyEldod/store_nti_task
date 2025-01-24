import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/cart_data.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  CartData cartData = CartData();

  getAddToCartCubit() async {
    emit(CartLoadingState());
    cartData.addToCard();
    emit(CartSuccessState());
  }

  getAllCartCubit() async {
    emit(CartLoadingState());
    var succes = await cartData.getAllCart();
    emit(CartGetAllSuccess(listCart: succes));
  }

  deleteCartCubit({required String productId}) {
    emit(CartLoadingState());
    cartData.deleteCart(productId: productId);
    emit(CartDelete());
    getAllCartCubit();
  }
}
