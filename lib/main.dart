import 'package:bloc_weatherapp/bloc/weather_bloc.dart';
import 'package:bloc_weatherapp/repository/weather_repo.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/weather_model.dart';
import 'ui/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.green[900],
        body: MultiBlocProvider(
          providers: [
            BlocProvider<WeatherBloc>(
              create: (BuildContext context) => WeatherBloc(WeatherRepo()),
            ),
          ],
          child: SearchScreen(),
        ),
      ),
    );
  }
}
