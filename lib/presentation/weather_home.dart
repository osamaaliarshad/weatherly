import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherHomePage extends StatefulWidget {
  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffD8DEE9), Color(0xff88C0D0)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  final Shader linearGradient2 = LinearGradient(
    colors: <Color>[Color(0xffD8DEE9), Color(0xffEBCB8B)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'location',
                style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Ubuntu',
                    foreground: Paint()..shader = linearGradient),
              ),
              SizedBox(
                height: 1,
              ),
              Text(
                'weather info',
                style: TextStyle(
                    fontFamily: 'Ubuntu', color: Colors.white, fontSize: 20),
              ),
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
              Text(
                '34°',
                style: TextStyle(
                    fontSize: 60,
                    fontFamily: 'Ubuntu',
                    foreground: Paint()..shader = linearGradient),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
