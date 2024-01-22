import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import '../config/api_constants.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = Dio();
  return ApiService(dio);
});

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getWeatherForecast(String locationName) async {
    try {
      Map<String, dynamic> newParams = {};
      newParams['Authorization'] = ApiConstants.apiKey;
      newParams['locationName'] = locationName;
      final response = await _dio.get(ApiConstants.weatherForecastUrl, queryParameters: newParams);
      return response.data;
    } catch (error) {
      throw Exception('Failed to fetch weather data: $error');
    }
  }
}
