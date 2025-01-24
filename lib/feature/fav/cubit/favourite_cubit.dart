import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  static FavouriteCubit get(context) => BlocProvider.of(context);
  FavouriteCubit() : super(FavouriteInitial());
  final FavData favData = FavData();

  addFavCubit({required String productId}) {
    emit(FavouriteLoad());
    FavData.addFav();
    emit(FavouriteSuccess());
  }

  getAllFav() async {
    emit(FavouriteLoad());
    var success = await FavData.getAllFav();
    emit(GetFavouriteSuccess(listFav: success));
  }

  deleteAllFav({required String productId}) {
    emit(FavouriteLoad());
    FavData.deleteAllFav(productId: productId);
    getAllFav();
  }
}
