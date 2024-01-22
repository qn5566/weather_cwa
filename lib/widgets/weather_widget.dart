import 'package:flutter/material.dart';

import '../response/model/weather_forecast_model.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherForecast weatherForecast;

  const WeatherWidget({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (weatherForecast.locations.isNotEmpty)
          Column(
            children: weatherForecast.locations.map((location) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 城市名稱
                  Center(
                    child: Text(
                      '城市名稱: ${location.locationName}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    children: location.weatherElements.map((element) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              '天氣因子: ${element.elementName}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Column(
                            children: element.timePeriods.map((timePeriod) {
                              return ListTile(
                                title: Text(
                                    '${timePeriod.parameter.parameterName} / '
                                        '${timePeriod.parameter.parameterValue}'
                                        '${timePeriod.parameter.parameterUnit != null ? ' ${timePeriod.parameter.parameterUnit}' : ''}'),
                                subtitle: Text(
                                    '時間: ${timePeriod.startTime} - ${timePeriod.endTime}'),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            }).toList(),
          ),
        if (weatherForecast.locations.isEmpty)
          const Text(
            '搜尋條件為空',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
      ],
    );
  }

}
