import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:weatherly/presentation/weather_home.dart';

void main() {
  runApp(MyApp());
}

//yes
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: WeatherHomePage(),
      ),
    );
  }
}
