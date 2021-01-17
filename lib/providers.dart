import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'infrastructure/weather_repository.dart';

final weatherDataFutureProvider =
    FutureProvider<List<String>>((ref) => getWeatherData());
