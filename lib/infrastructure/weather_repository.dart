import 'model/location.dart';
import 'model/networking.dart';
import 'model/weather.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class WeatherRepository {
  Future<Weather> fetchWeather(String cityName);

  Future<void> getLocationData() async {
    Location location = new Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${DotEnv().env['apiKey']}');

    var weatherData = await networkHelper.getData();
    //ouble temperature = weatherData['main']['temp'];
    String cityName = weatherData['name'];
    print(cityName);
  }
}
