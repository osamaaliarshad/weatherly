import 'package:flutter/cupertino.dart';

class Weather {
  String cityName;
  String description;
  double tempFarenheit;

  Weather(
      {@required this.cityName,
      @required this.tempFarenheit,
      @required this.description});
}
