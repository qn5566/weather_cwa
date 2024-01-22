import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_cwa/providers/logger_obs.dart';
import 'package:weather_cwa/providers/weather_provider.dart';

import 'package:weather_cwa/response/model/weather_forecast_model.dart';
import 'package:weather_cwa/service/api_service.dart';
import 'package:weather_cwa/widgets/search_bar_widgets.dart';
import 'package:weather_cwa/widgets/weather_widget.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const MyApp(),
    ),
  );
}

// final weatherProvider = FutureProvider.autoDispose
//     .family<WeatherForecast, String>((ref, locationName) async {
//   final apiService = ref.read(apiServiceProvider);
//   final response = await apiService.getWeatherForecast(locationName);
//
//   return WeatherForecast.fromJson(response);
// });

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String location = "";
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('天氣預報APP'),
        ),
        body: Column(
          children: [
            SearchBarCustom(
              onSearch: (locationName) {
                location = locationName;
                ref.read(queryProvider.notifier).state = locationName;
              },
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  final weatherFuture = ref.watch(weatherProvider);

                  return weatherFuture.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    error: (error, stackTrace) => Text('Error: $error'),
                    data: (weatherForecast) => SingleChildScrollView(
                        child: WeatherWidget(weatherForecast: weatherForecast)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
