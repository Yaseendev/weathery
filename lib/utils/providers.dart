import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weathery/database/moorDB.dart';
import 'app_locale.dart';
import 'converters.dart';
import 'repository.dart';
import 'themes.dart';

final currentLocationProvider = Provider<Position>((ref) {
  throw UnimplementedError();
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final temperatureUnitProvider = StateProvider<TemperatureUnit>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  temperatureUnit = TemperatureUnit
      .values[prefs.getInt('unit') ?? TemperatureUnit.celsius.index];
  return temperatureUnit;
});

final refreshLocationWeather =
    FutureProvider.autoDispose.family<Weather?, Position>((ref, position) async {
  Repository repo = ref.watch(repoProvider);
  final test =
      await repo.fetchCurrentWeather(position.latitude, position.longitude);
  print('Refresher -> $test');
  try {
    return repo.fetchCurrentWeather(position.latitude, position.longitude);
  } catch (e) {
    return repo.fetchFromCache(
        ref.watch(sharedPreferencesProvider).getInt('currentCityId'));
  }
});

final initStreamProvider = StateProvider<bool>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  if (prefs.getInt('currentCityId') == null) return false;
  return true;
});

final refreshSavedWeather =
    FutureProvider.autoDispose.family<Weather, Position>((ref, position) {
  Repository repo = ref.watch(repoProvider);
  return repo.fetchAndSaveWeather(position.latitude, position.longitude);
});

final repoProvider =
    Provider<Repository>((ref) => Repository(ref.watch(moorDatabaseProvider)));

final moorDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

final weatherListStreamProvider = StreamProvider<List<Weather>>((ref) {
  final database = ref.watch(moorDatabaseProvider);
  int? cureentLocationID =
      ref.watch(sharedPreferencesProvider).getInt('currentCityId');
  return database.watchEntries(cureentLocationID ?? 0);
});
final initWeatherListStreamProvider =
    StreamProvider.family<List<Weather>, int>((ref, id) {
  final database = ref.watch(moorDatabaseProvider);
  return database.watchEntries(id);
});

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

final appThemeStateProvider = StateNotifierProvider<AppThemeNotifier ,dynamic>((ref) {
  final _isDarkModeEnabled =
      ref.read(sharedPreferencesProvider).getBool('isDarkModeEnabled');
  return AppThemeNotifier(_isDarkModeEnabled ?? false);
});

final appLocaleProvider = Provider<AppLocale>((ref) => AppLocale());

final appLocaleStateProvider = StateNotifierProvider<AppLocaleNotifier, dynamic>((ref) {
  final prefs = ref.read(sharedPreferencesProvider);
  prefs.getBool('inEN') ?? prefs.setBool('inEN', true);
  final _isInEn = prefs.getBool('inEN');
  return AppLocaleNotifier(_isInEn ?? false);
});
