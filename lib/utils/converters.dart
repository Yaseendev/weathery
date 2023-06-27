import 'package:flutter_riverpod/flutter_riverpod.dart';

intToDouble(dynamic val) {
  if (val.runtimeType == double) {
    return val;
  } else if (val.runtimeType == int) {
    return val.toDouble();
  } else {
    throw new Exception("value is not of type 'int' or 'double' got type '" +
        val.runtimeType.toString() +
        "'");
  }
}

enum TemperatureUnit { kelvin, celsius, fahrenheit }

TemperatureUnit temperatureUnit = TemperatureUnit.celsius;

class Temperature extends StateNotifier<double> {
  final double _celsius;

  Temperature(this._celsius) : super(_celsius);

  double get celsius => _celsius;

  double get kelvin => _celsius + 273.15;

  double get fahrenheit => _celsius * (9 / 5) + 32;

  double as(TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.kelvin:
        return this.kelvin;
      case TemperatureUnit.celsius:
        return this.celsius;
      case TemperatureUnit.fahrenheit:
        return this.fahrenheit;
    }
  }

  static String getTemperSympol(TemperatureUnit unit) {
    switch (unit) {
      case TemperatureUnit.celsius:
        return '℃';
      case TemperatureUnit.fahrenheit:
        return '℉';
      case TemperatureUnit.kelvin:
        return 'ºK';
    }
  }
}
