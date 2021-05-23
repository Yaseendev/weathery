import 'package:shared_preferences/shared_preferences.dart';
import 'package:weathery/database/moorDB.dart';
import 'weatherApi_provider.dart';

class Repository {
  final AppDatabase appDatabase;
  Repository(this.appDatabase);
  WeatherApiProvider wap = WeatherApiProvider();
  Future<Weather> fetchFromCache(int currentCityId) async {
    if (currentCityId == null) {
      return null;
    }
    Weather tempWeather = await appDatabase.getCurrentWeather(currentCityId);
    return tempWeather;
  }

  Future<Weather> fetchCurrentWeather(double lat, double lon) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Weather cityWeather = await wap.fetchWeather(lat, lon);
    final t = await appDatabase.getCurrentWeather(cityWeather.id);
    t == null
        ? appDatabase.insertWeather(cityWeather)
        : appDatabase.updateWeather(cityWeather);
    prefs.setInt('currentCityId', cityWeather.id);
    return cityWeather;
  }

  Future<Weather> fetchAndSaveWeather(double lat, double lon) async {
    Weather cityWeather = await fetchCityWeather(lat, lon);
    appDatabase.updateWeather(cityWeather);
    return cityWeather;
  }

  Future<Weather> fetchCityWeather(double lat, double lon) async {
    Weather cityWeather = await wap.fetchWeather(lat, lon);
    return cityWeather;
  }
}
