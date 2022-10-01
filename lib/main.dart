import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_introduction_app/bloc/game_data_bloc.dart';
import 'package:game_introduction_app/repository/game_repository.dart';
import 'package:game_introduction_app/view/landing_view.dart';

void main() {
  runApp(BlocProvider<GameDataBloc>(
    create: (context) => GameDataBloc(GameRepository()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game Introduction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const LandingView(),
    );
  }
}
