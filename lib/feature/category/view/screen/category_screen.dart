import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/cubit/category_cubit.dart';
import '../../cubit/cubit/category_state.dart';
import '../../model/category_data.dart';
import '../widget/app_bar.dart';
import '../widget/gridview.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen(
      {required this.endPoint, super.key, required this.title});
  final String endPoint;
  final String title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CategoryCubit(CategoryData())..getDateCubit(endPoint),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: categoryAppBar(title: title),
        body: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            if (state is CategorySuccess) {
              return Expanded(
                child: MyGridView(state: state),
              );
            } else if (state is CategoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CategoryFail) {
              return Center(
                child: Text(
                  'Error: ${state.error}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'No Data Available',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}