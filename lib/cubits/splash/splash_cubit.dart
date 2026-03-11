import 'package:flutter_bloc/flutter_bloc.dart';

//States
abstract class SplashState {}

class SplashLoading extends SplashState {}

class SplashReady extends SplashState {}

//Cubit
class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading()) {
    _startTimer();
  }

  void _startTimer() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashReady());
  }
}
