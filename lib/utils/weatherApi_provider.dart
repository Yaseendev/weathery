import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weathery/database/moorDB.dart';

class WeatherApiProvider {
  static const String rootUrl = 'http://api.openweathermap.org/data/2.5';
  static const String appid =
      ''; //TODO: Get your appid from openweathermap.org and paste it here
  http.Client client = http.Client();

  Future<Map<String, dynamic>> getCurrentWeather(
      double latitude, double longitude) async {
    final response = await client.get(Uri.parse(
        '$rootUrl/onecall?lat=$latitude&lon=$longitude&exclude=minutely&appid=$appid&units=metric'));

    if (response.statusCode != 200) {
      print(response.statusCode.toString() + " unable to fetch weather data");
    }
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getCityWeather(
      double latitude, double longitude) async {
    final response = await client.get(Uri.parse(
        '$rootUrl/weather?lat=$latitude&lon=$longitude&appid=$appid&units=metric'));

    if (response.statusCode != 200) {
      print(response.statusCode.toString() + " unable to fetch weather data");
    }
    return json.decode(response.body);
  }

  Future<Map<String, dynamic>> getCityWeatherInArabic(
      double latitude, double longitude) async {
    final response = await client.get(Uri.parse(
        '$rootUrl/weather?lat=$latitude&lon=$longitude&appid=$appid&lang=ar'));

    if (response.statusCode != 200) {
      print(response.statusCode.toString() + " unable to fetch weather data");
    }
    return json.decode(response.body);
  }

  Future<Weather> fetchWeather(double latitude, double longitude) async {
    final cityData = await getCityWeather(latitude, longitude);
    final forecastDataInAr = await getCityWeatherInArabic(latitude, longitude);
    final forecastData = await getCurrentWeather(latitude, longitude);
    return Weathers.fromJson(
        weatherData: cityData,
        forecastData: forecastData,
        arData: forecastDataInAr);
  }
}
