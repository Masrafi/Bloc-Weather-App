import 'package:bloc_weatherapp/ui/show_weather.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../main.dart';

class SearchScreen extends StatelessWidget {
  var cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: 300,
            width: 300,
            child: FlareActor(
              'assets/WorldSpain.flr',
              fit: BoxFit.contain,
              animation: 'roll',
            ),
          ),
        ),
        BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
          if (state is WeatherIsNotSearched) {
            return Container(
              padding: EdgeInsets.only(left: 32, right: 32),
              child: Column(
                children: [
                  Text(
                    "Search Weather",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    "Instanly",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w200,
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white70,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          style: BorderStyle.solid,
                        ),
                      ),
                      hintText: "City Name",
                      hintStyle: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      color: Colors.lightBlue,
                      child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else if (state is WeatherIsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherIsLoaded) {
            return ShowWeather(state.getWeather, cityController.text);
          } else {
            return Text(
              "Error",
              style: TextStyle(color: Colors.white),
            );
          }
        })
      ],
    );
  }
}
