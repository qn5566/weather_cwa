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
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather Forecast App'),
        ),
        body: Column(
          children: [
            SearchBarCustom(
              onSearch: (locationName) {
                // 在用户点击搜索按钮时更新 weatherProvider 数据
                ref.read(weatherProvider);
              },
            ),
            Expanded(
              child: Consumer(
                builder: (context, watch, child) {
                  final weatherFuture = ref.watch(weatherProvider);

                  return weatherFuture.when(
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stackTrace) => Text('Error: $error'),
                    data: (weatherForecast) => WeatherWidget(weatherForecast: weatherForecast),
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
