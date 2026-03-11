import 'package:budgetly/cubits/expenses/expenses_cubit.dart';
import 'package:budgetly/cubits/splash/splash_cubit.dart';
import 'package:budgetly/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ExpenseCubit())],
      child: MaterialApp(
        title: 'Budgetly',
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => SplashCubit(),
          child: SplashScreen(),
        ),
      ),
    );
  }
}
