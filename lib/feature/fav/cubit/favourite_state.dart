
import '../model/fav_model.dart';

sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoad extends FavouriteState {}
final class FavouriteSuccess extends FavouriteState {}

final class GetFavouriteSuccess extends FavouriteState {
  List<FavModel> listFav;
  GetFavouriteSuccess({required this.listFav});
}
