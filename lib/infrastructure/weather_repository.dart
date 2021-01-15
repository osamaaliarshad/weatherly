import 'model/weather.dart';

//weather repository should fetch the weather info from the weather class
Future<List<String>> getWeatherData() async {
  Weather weather = Weather();
  await weather.getLocationData();
  return weather.weatherList;
}
