import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<int> {
  CategoryCubit() : super(4);

  void selectCategory(int index) {
    emit(index);
  }
}