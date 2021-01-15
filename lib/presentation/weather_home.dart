import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weatherly/infrastructure/weather_repository.dart';

final weatherDataFutureProvider =
    FutureProvider<List<String>>((ref) => getWeatherData());

class WeatherHomePage extends ConsumerWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffD8DEE9), Color(0xff88C0D0)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  final Shader linearGradient2 = LinearGradient(
    colors: <Color>[Color(0xffD8DEE9), Color(0xffEBCB8B)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context, watch) {
    final weather = watch(weatherDataFutureProvider);
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              weather.when(
                  data: (value) => Text(
                        '${value[0].toString()}',
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'Ubuntu',
                            foreground: Paint()..shader = linearGradient),
                      ),
                  loading: () => CircularProgressIndicator(),
                  error: (e, stack) => Text('Error: $e')),
              SizedBox(
                height: 1,
              ),
              weather.when(
                  data: (value) => Text(
                        '${value[2].toString()}',
                        style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                            fontSize: 20),
                      ),
                  loading: () => CircularProgressIndicator(),
                  error: (e, stack) => Text('Error: $e')),
              SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                'assets/windy_rain.svg',
                color: Color(0xffE5E9F0),
                height: 300,
              ),
              SizedBox(
                height: 5,
              ),
              weather.when(
                data: (value) => Text(
                  '${value[1].toString()}°f',
                  style: TextStyle(
                      fontSize: 60,
                      fontFamily: 'Ubuntu',
                      foreground: Paint()..shader = linearGradient),
                ),
                loading: () => CircularProgressIndicator(),
                error: (e, stack) => Text('Error: $e'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
