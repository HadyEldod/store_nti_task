import 'package:bloc/bloc.dart';

import '../../model/category_data.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.category) : super(CategoryInitial());
  final CategoryData category;
 
  getDateCubit(String endpoint) async {
    emit(CategoryLoading());
    var categories = await category.getData(endpoint: endpoint);
    emit(CategorySuccess(category: categories));
  }
}
