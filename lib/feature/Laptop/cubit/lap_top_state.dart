
import '../model/laptop_model.dart';

sealed class LaptopState {}

final class LaptopInitial extends LaptopState {}

final class LaptopLoading extends LaptopState {}

final class LaptopSuccess extends LaptopState {
  final List<LaptopModel> laptopList;
  LaptopSuccess({required this.laptopList});
}

final class LaptopFailed extends LaptopState {}