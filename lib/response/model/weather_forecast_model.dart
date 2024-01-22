class WeatherForecast {
  final bool success;
  final WeatherForecastResult result;
  final List<Location> locations;

  WeatherForecast({required this.success, required this.result, required this.locations});

  factory WeatherForecast.fromJson(Map<String, dynamic> json) {
    return WeatherForecast(
      success: json['success'] as bool? ?? false,
      result: WeatherForecastResult.fromJson(json['result'] ?? {}),
      locations: (json['records']['location'] as List<dynamic>? ?? []).map((location) {
        return Location.fromJson(location);
      }).toList(),
    );
  }

  // 新增的构造函数
  WeatherForecast.loading()
      : success = true,
        result = WeatherForecastResult(resourceId: '', fields: []),
        locations = [];
}

class WeatherForecastResult {
  final String resourceId;
  final List<Field> fields;

  WeatherForecastResult({required this.resourceId, required this.fields});

  factory WeatherForecastResult.fromJson(Map<String, dynamic> json) {
    return WeatherForecastResult(
      resourceId: json['resource_id'] as String? ?? '',
      fields: (json['fields'] as List<dynamic>? ?? []).map((field) => Field.fromJson(field)).toList(),
    );
  }
}

class Field {
  final String id;
  final String type;

  Field({required this.id, required this.type});

  factory Field.fromJson(Map<String, dynamic> json) {
    return Field(
      id: json['id'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );
  }
}

class Location {
  final String locationName;
  final List<WeatherElement> weatherElements;

  Location({required this.locationName, required this.weatherElements});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      locationName: json['locationName'] as String? ?? '',
      weatherElements: (json['weatherElement'] as List<dynamic>? ?? [])
          .map((element) => WeatherElement.fromJson(element))
          .toList(),
    );
  }
}

class WeatherElement {
  final String elementName;
  final List<TimePeriod> timePeriods;

  WeatherElement({required this.elementName, required this.timePeriods});

  factory WeatherElement.fromJson(Map<String, dynamic> json) {
    return WeatherElement(
      elementName: json['elementName'] as String? ?? '',
      timePeriods: (json['time'] as List<dynamic>? ?? [])
          .map((time) => TimePeriod.fromJson(time))
          .toList(),
    );
  }
}

class TimePeriod {
  final String startTime;
  final String endTime;
  final Parameter parameter;

  TimePeriod({required this.startTime, required this.endTime, required this.parameter});

  factory TimePeriod.fromJson(Map<String, dynamic> json) {
    return TimePeriod(
      startTime: json['startTime'] as String? ?? '',
      endTime: json['endTime'] as String? ?? '',
      parameter: Parameter.fromJson(json['parameter'] ?? {}),
    );
  }
}

class Parameter {
  final String parameterName;
  final String parameterValue;
  final String? parameterUnit;

  Parameter({required this.parameterName, required this.parameterValue, this.parameterUnit});

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      parameterName: json['parameterName'] as String? ?? '',
      parameterValue: json['parameterValue'] as String? ?? '',
      parameterUnit: json['parameterUnit'] as String?,
    );
  }
}
