import 'dart:convert';
import 'package:drift_sqflite/drift_sqflite.dart';
import 'package:drift/drift.dart';
import 'package:weathery/utils/converters.dart';

part 'moorDB.g.dart';

class Weathers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get cityName => text().withLength(min: 1, max: 50)();
  TextColumn get countryName => text().withLength(min: 1, max: 10)();
  RealColumn get latitude => real()();
  RealColumn get longitude => real()();
  TextColumn get main => text().withLength(min: 1, max: 50)();
  TextColumn get description => text().withLength(min: 1, max: 50)();
  RealColumn get temperature => real()();
  RealColumn get maxTemperature => real()();
  RealColumn get minTemperature => real()();
  RealColumn get feelslike => real()();
  IntColumn get pressure => integer()();
  IntColumn get humidity => integer()();
  IntColumn get visibility => integer()();
  RealColumn get dewPoint => real()();
  RealColumn get uvi => real()();
  RealColumn get windSpeed => real()();
  RealColumn get windDegree => real()();
  IntColumn get time => integer()();
  IntColumn get sunrise => integer()();
  IntColumn get sunset => integer()();
  TextColumn get iconCode => text().withLength(min: 1, max: 50)();
  TextColumn get hourlyForecast => text()();
  TextColumn get dailyForecast => text()();
  TextColumn get arCityName => text()();
  TextColumn get arDesc => text()();

  static Weather fromJson(
      {required Map<String, dynamic> weatherData,
      required Map<String, dynamic> forecastData,
      required Map<String, dynamic> arData}) {
    final currentWeather = forecastData['current'];
    final weatherArr = currentWeather['weather'][0];
    return Weather(
        id: weatherData['id'],
        cityName: weatherData['name'],
        countryName: weatherData['sys']['country'],
        latitude: intToDouble(weatherData['coord']['lat']),
        longitude: intToDouble(weatherData['coord']['lon']),
        main: weatherArr['main'],
        description: weatherArr['description'],
        temperature: intToDouble(currentWeather['temp']),
        maxTemperature: intToDouble(weatherData['main']['temp_max']),
        minTemperature: intToDouble(weatherData['main']['temp_min']),
        feelslike: intToDouble(weatherData['main']['feels_like']),
        pressure: weatherData['main']['pressure'],
        humidity: weatherData['main']['humidity'],
        visibility: weatherData['visibility'],
        windSpeed: intToDouble(weatherData['wind']['speed']),
        windDegree: intToDouble(currentWeather['wind_deg']),
        dewPoint: intToDouble(currentWeather['dew_point']),
        uvi: intToDouble(currentWeather['uvi']),
        time: currentWeather['dt'],
        sunrise: currentWeather['sunrise'],
        sunset: currentWeather['sunset'],
        iconCode: weatherArr['icon'],
        hourlyForecast: jsonEncode(forecastData['hourly']),
        dailyForecast: jsonEncode(forecastData['daily']),
        arCityName: arData['name'],
        arDesc: arData['weather'][0]['description']);
  }
}

@DriftDatabase(tables: [Weathers])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(SqfliteQueryExecutor.inDatabaseFolder(
            path: 'db3.sqlite', logStatements: true));

  @override
  int get schemaVersion => 1;

  Future<List<Weather>> getAllCities() => select(weathers).get();
  Stream<List<Weather>> watchAllCities() => select(weathers).watch();
  Future insertWeather(Weather w) => into(weathers).insert(w);
  Future updateWeather(Weather currentWeather) =>
      update(weathers).replace(currentWeather);
  Future clear() => delete(weathers).go();
  Stream<List<Weather>> watchEntries(int n) =>
      (select(weathers)..where((tbl) => tbl.id.equals(n).not())).watch();

  Future<Weather> getCurrentWeather(int cityID) =>
      (select(weathers)..where((tbl) => tbl.id.equals(cityID))).getSingle();
  Future deleteWeather(Weather w) => delete(weathers).delete(w);
}
