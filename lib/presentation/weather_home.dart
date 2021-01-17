import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/all.dart';
import '../providers.dart';
import 'get_icon.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          context.refresh(weatherDataFutureProvider);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  weather.when(
                      data: (city) => Text(
                            '${city[0].toString()}',
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
                      data: (description) => Text(
                            '${description[2].toString()}',
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
                  weather.when(
                      data: (description) => weatherIconPicker(description),
                      loading: () => CircularProgressIndicator(),
                      error: (e, stack) => Text('Error: $e')),
                  SizedBox(
                    height: 5,
                  ),
                  weather.when(
                    data: (temp) => Text(
                      '${temp[1].toString()}°f',
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
        ),
      ),
    );
  }
}

Widget weatherIconPicker(description) {
  switch (description[2].toString()) {
    case "Clear":
      {
        return GetIcon(
          icon: 'sunny',
        );
      }
      break;
    case "Clouds":
      {
        return GetIcon(
          icon: 'clouds',
        );
      }
      break;
    case "Rain":
      {
        return GetIcon(
          icon: 'rain',
        );
      }
      break;
    case "Drizzle":
      {
        return GetIcon(
          icon: 'drizzle',
        );
      }
      break;
    case "Snow":
      {
        return GetIcon(
          icon: 'snow',
        );
      }
      break;
    case "Fog":
      {
        return GetIcon(
          icon: 'fog',
        );
      }
      break;
    case "Thunderstorm":
      {
        return GetIcon(
          icon: 'thunderstorm',
        );
      }
      break;
    default:
      return GetIcon(
        icon: 'default',
      );
  }
}
