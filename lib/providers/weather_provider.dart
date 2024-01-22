import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_cwa/response/model/weather_forecast_model.dart';
import 'package:weather_cwa/service/api_service.dart';

final weatherProvider = FutureProvider.autoDispose
    .family<WeatherForecast, String>((ref, locationName) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getWeatherForecast(locationName);

  return WeatherForecast.fromJson(response);
});
