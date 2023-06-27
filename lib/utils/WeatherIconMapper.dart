import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

mixin WeatherIconsMapper {
  IconData getIconData(String iconCode) {
    switch (iconCode) {
      case '01d':
        return WeatherIcons.day_sunny;
      case '01n':
        return WeatherIcons.night_clear;
      case '02d':
        return WeatherIcons.day_cloudy;
      case '02n':
        return WeatherIcons.night_cloudy;
      case '03d':
        return WeatherIcons.cloud;
      case '04d':
        return WeatherIcons.day_cloudy_high;
      case '03n':
        return WeatherIcons.cloud;
      case '04n':
        return WeatherIcons.night_cloudy_high;
      case '09d':
        return WeatherIcons.day_showers;
      case '09n':
        return WeatherIcons.night_showers;
      case '10d':
        return WeatherIcons.day_rain;
      case '10n':
        return WeatherIcons.night_rain;
      case '11d':
        return WeatherIcons.day_thunderstorm;
      case '11n':
        return WeatherIcons.night_thunderstorm;
      case '13d':
        return WeatherIcons.day_snow;
      case '13n':
        return WeatherIcons.night_snow;
      case '50d':
        return WeatherIcons.day_fog;
      case '50n':
        return WeatherIcons.night_fog;
      default:
        return WeatherIcons.day_sunny_overcast;
    }
  }

  String getImageUri(String iconCode) {
    String path = 'assets/images';
    switch (iconCode) {
      case '01d':
        return '$path/sunny.jpg';
      case '01n':
        return '$path/clear_night.jpg';
      case '02d':
        return '$path/clouds_day.jpeg';
      case '02n':
        return '$path/clouds_night.jpg';
      case '03d':
        return '$path/clouds_day.jpeg';
      case '04d':
        return '$path/cloudy_day.jpg';
      case '03n':
        return '$path/clouds_night.jpg';
      case '04n':
        return '$path/cloudy_night.jpg';
      case '09d':
        return '$path/rain-storm.jpg';
      case '09n':
        return '$path/rain_shower_night.jpg';
      case '10d':
        return '$path/Rainy-Day.jpg';
      case '10n':
        return '$path/rainy_night.jpg';
      case '11d':
        return '$path/thunder_day.jpg';
      case '11n':
        return '$path/thunder_night.jpg';
      case '13d':
        return '$path/snow_day.jpg';
      case '13n':
        return '$path/snow_night.jpg';
      case '50d':
        return '$path/fog_day.jpg';
      case '50n':
        return '$path/fog_night.jpg';
      default:
        return '$path/sunny.jpg';
    }
  }
}
