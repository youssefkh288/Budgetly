import 'package:budgetly/cubits/splash/splash_cubit.dart';
import 'package:budgetly/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is SplashReady) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Image.asset('assets/budgetly_logo.png'),
              SizedBox(height: 20),
              Text(
                'Budgetly.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text(
                'Organize your finances calmly.',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 80),
              LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.blue,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
