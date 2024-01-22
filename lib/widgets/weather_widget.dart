import 'package:flutter/material.dart';

import '../response/model/weather_forecast_model.dart';

class WeatherWidget extends StatelessWidget {
  final WeatherForecast weatherForecast;

  WeatherWidget({required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Success: ${weatherForecast.success}'),
        SizedBox(height: 20),
        Text('Weather Forecast:'),
        Column(
          children: weatherForecast.locations.map((location) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Location: ${location.locationName}'),
                Column(
                  children: location.weatherElements.map((element) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Element: ${element.elementName}'),
                        Column(
                          children: element.timePeriods.map((timePeriod) {
                            return ListTile(
                              title:
                                  Text('Start Time: ${timePeriod.startTime}'),
                              subtitle: Text(
                                  'End Time: ${timePeriod.endTime}\nParameter: ${timePeriod.parameter.parameterName} - ${timePeriod.parameter.parameterValue}${timePeriod.parameter.parameterUnit != null ? ' ${timePeriod.parameter.parameterUnit}' : ''}'),
                            );
                          }).toList(),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}
