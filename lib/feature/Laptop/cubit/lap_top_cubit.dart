import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/laptop_data.dart';
import 'lap_top_state.dart';


class LaptopCubit extends Cubit<LaptopState> {
  LaptopCubit() : super(LaptopInitial());
  final LaptopData laptopData = LaptopData();

  getLaptop()async {
    emit(LaptopLoading());
    var listLap = await LaptopData.getAllData();
    emit(LaptopSuccess(laptopList: listLap));
  }
}