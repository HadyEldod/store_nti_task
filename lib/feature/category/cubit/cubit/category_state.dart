
import '../../../../core/model/category_model.dart';

sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {
  List<CategoryModel> category;
  CategorySuccess({required this.category});
}

final class CategoryFail extends CategoryState {
  String error;
  CategoryFail({required this.error});
}
