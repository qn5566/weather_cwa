import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_cwa/response/model/weather_forecast_model.dart';
import 'package:weather_cwa/service/api_service.dart';

final weatherProvider = FutureProvider.autoDispose<WeatherForecast>((ref) async {
  final apiService = ref.read(apiServiceProvider);
  final response = await apiService.getWeatherForecast('桃園市');

  // 使用 WeatherForecast.fromJson 进行数据转换
  return WeatherForecast.fromJson(response);
});
