import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_cwa/response/model/weather_forecast_model.dart';
import 'package:weather_cwa/service/api_service.dart';

final queryProvider = StateProvider((ref) => '');

final weatherProvider = FutureProvider<WeatherForecast>((ref) async {
  final queryCity = ref.watch(queryProvider);
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getWeatherForecast(locationName: queryCity);

  return WeatherForecast.fromJson(response);
});
