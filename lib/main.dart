import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            BlocProvider<BlocA>(
              create: (BuildContext context) => BlocA(),
            ),
          ],
          child: SearchScreen(),
        ),
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  var cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
        Container(
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
        )
      ],
    );
  }
}

class ShowWeather extends StatelessWidget {
  WeatherModel weather;
  final city;

  ShowWeather(this.weather, this.city);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 32, left: 32, top: 10),
        child: Column(
          children: <Widget>[
            Text(
              city,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              weather.getTemp.round().toString() + "C",
              style: TextStyle(color: Colors.white70, fontSize: 50),
            ),
            Text(
              "Temprature",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      weather.getMinTemp.round().toString() + "C",
                      style: TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    Text(
                      "Min Temprature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      weather.getMaxTemp.round().toString() + "C",
                      style: TextStyle(color: Colors.white70, fontSize: 30),
                    ),
                    Text(
                      "Max Temprature",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              height: 50,
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                onPressed: () {
                  //BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
                },
                color: Colors.lightBlue,
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ),
            )
          ],
        ));
  }
}
