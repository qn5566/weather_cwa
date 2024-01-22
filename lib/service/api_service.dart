import 'package:riverpod/riverpod.dart';
import 'package:dio/dio.dart';
import '../config/api_constants.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = Dio(BaseOptions(
      headers: {'device': 'mobile'},
      connectTimeout: const Duration(milliseconds: 1000000),
      receiveTimeout: const Duration(milliseconds: 200000)));

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return ApiService(dio);
});

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> getWeatherForecast({String locationName = "桃園市"}) async {
    try {
      Map<String, dynamic> newParams = {};
      newParams['Authorization'] = ApiConstants.apiKey;
      newParams['locationName'] = locationName;
      final response = await _dio.get(ApiConstants.weatherForecastUrl,
          queryParameters: newParams);
      return response.data;
    } catch (error) {
      throw Exception('Failed to fetch weather data: $error');
    }
  }
}
