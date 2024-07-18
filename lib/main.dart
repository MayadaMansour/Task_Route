import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_route/screens/home/home_screen.dart';
import 'core/main_cubit/cubit/main_cubit.dart';

Future<void> main() async {
  runApp(BlocProvider(
    create: (context) => MainCubit()..getHomeData(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
