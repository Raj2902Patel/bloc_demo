import 'package:bloc_demo/bloc/calculator/calculatorCubit.dart';
import 'package:bloc_demo/bloc/cubit/counterCubit.dart';
import 'package:bloc_demo/bloc/equatable/counterBloc.dart';
import 'package:bloc_demo/bloc/equatable/counterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => CounterBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => CounterCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => CalculatorCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        textTheme: GoogleFonts.outfitTextTheme(),
      ),
      home: const CounterPage(),
    );
  }
}
