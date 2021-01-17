import 'location.dart';
import 'networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Weather {
  List<String> weatherList = [];

  Future<List<String>> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&units=imperial&appid=${DotEnv().env['apiKey']}');

    var weatherData = await networkHelper.getData();

    String cityName = await weatherData['name'];
    double tempFarenheit = await weatherData['main']['temp'];
    String description = await weatherData['weather'][0]['main'];

    weatherList.add(cityName);
    weatherList.add(tempFarenheit.toStringAsFixed(0));
    weatherList.add(description);

    return weatherList;
  }
}
