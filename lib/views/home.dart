import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weathery/database/moorDB.dart';
import 'package:weathery/utils/providers.dart';
import 'package:weathery/widgets/search_widget.dart';
import 'package:weathery/widgets/weather_card.dart';
import '../widgets/mainWeather_card.dart';
import '../utils/repository.dart';
import 'settings_screen.dart';
import 'weather_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

Weather? _cachedWeather;

class HomeScreen extends ConsumerWidget {
  final Position currentLocation;
  HomeScreen({required this.currentLocation});
  final fromHome = StateProvider<bool>((ref) => false);
  @override
  Widget build(BuildContext context, ref) {
    final weatherState = ref.watch(refreshLocationWeather(currentLocation));
    final prefs = ref.watch(sharedPreferencesProvider);
    final cachedCityId = prefs.getInt('currentCityId');
    final startStreamListinig = ref.watch(initStreamProvider);
    final moorDatabase = ref.watch(moorDatabaseProvider);
    final repo = ref.watch(repoProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.saved_search,
                    size: 35,
                  ),
                  onPressed: () {
                    showSearch(context: context, delegate: CitySearch());
                  },
                ),
                Text(
                  '  Weathery☀',
                  style: GoogleFonts.pacifico().copyWith(
                      fontSize: 27,
                      letterSpacing: 6,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(_goToSettings());
                  },
                ),
              ],
            ),
            weatherState.when(
              loading: () => loadWeatherCard(context, repo, cachedCityId ?? 0),
              data: (weatherData) {
                return InkWell(
                    child: MainWeatherCard(cityWeather: weatherData),
                    onTap: () => Navigator.of(context).push(_goToWeatherRoute(
                        WeatherDetailsScreen(
                            weather: weatherData, fromProvider: fromHome))));
              },
              error: (e, st) {
                return InkWell(
                  child: _cachedWeather != null
                      ? MainWeatherCard(cityWeather: _cachedWeather)
                      : loadWeatherCard(context, repo, cachedCityId ?? 0),
                  onTap: () => Navigator.of(context).push(_goToWeatherRoute(
                      WeatherDetailsScreen(
                          weather: _cachedWeather, fromProvider: fromHome))),
                );
              },
            ),
            Divider(
              color: Colors.black,
              endIndent: 10,
              indent: 10,
              thickness: 2,
            ),
            startStreamListinig
                ? _renderStream(context, prefs, ref, moorDatabase)
                : Center(child: Text(AppLocalizations.of(context)!.addCity)),
          ],
        ),
      ),
    );
  }

  Widget loadWeatherCard(
      BuildContext context, Repository repo, int cachedCityId) {
    return FutureBuilder<Weather?>(
      future: repo.fetchFromCache(cachedCityId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return MainWeatherCard();
        _cachedWeather = snapshot.data;
        return InkWell(
          child: MainWeatherCard(
            cityWeather: _cachedWeather,
          ),
          onTap: () =>
              Navigator.of(context).push(_goToWeatherRoute(WeatherDetailsScreen(
            weather: _cachedWeather,
            fromProvider: fromHome,
          ))),
        );
      },
    );
  }

  Widget _renderStream(BuildContext context, SharedPreferences prefs, ref,
      AppDatabase moorDatabase) {
    return ref
        .watch(
            initWeatherListStreamProvider(prefs.getInt('currentCityId') ?? 0))
        .when(
            data: (listData) {
              return listData.isEmpty
                  ? Center(child: Text(AppLocalizations.of(context)!.addCity))
                  : Expanded(
                      child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: listData.length,
                          itemBuilder: (context, index) {
                            final Weather weather = listData[index];
                            final Position pos = Position(
                              latitude: weather.latitude,
                              longitude: weather.longitude,
                              accuracy: 0,
                              altitude: 0,
                              heading: 0,
                              speed: 0,
                              speedAccuracy: 0,
                              timestamp: null,
                            );
                            final savedWeatherState =
                                ref.watch(refreshSavedWeather(pos));
                            return savedWeatherState.when(data: (weatherData) {
                              Offset? _tapDownPosition;
                              return InkWell(
                                child: Align(
                                  child: WeatherCard(cityWeather: weatherData),
                                  alignment: Alignment.center,
                                ),
                                onTap: () => Navigator.of(context).push(
                                    _goToWeatherRoute(WeatherDetailsScreen(
                                        weather: weatherData,
                                        fromProvider: fromHome))),
                                onTapDown: (TapDownDetails details) {
                                  _tapDownPosition = details.globalPosition;
                                },
                                onLongPress: () {
                                  final RenderObject? overlay =
                                      Overlay.of(context)
                                          .context
                                          .findRenderObject();
                                  showMenu(
                                    context: context,
                                    position: RelativeRect.fromLTRB(
                                      _tapDownPosition!.dx,
                                      _tapDownPosition!.dy,
                                      overlay!.semanticBounds.size.width -
                                          _tapDownPosition!.dx,
                                      overlay.semanticBounds.size.height -
                                          _tapDownPosition!.dy,
                                    ),
                                    items: <PopupMenuEntry>[
                                      PopupMenuItem(
                                        value: weatherData,
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.delete,
                                                color: Colors.red),
                                            Text(
                                                AppLocalizations.of(context)!
                                                    .delete,
                                                style: TextStyle(
                                                    color: Colors.red)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ).then((city) {
                                    if (city != null)
                                      moorDatabase.deleteWeather(city);
                                  });
                                },
                              );
                            }, loading: () {
                              late Offset _tapDownPosition;
                              return InkWell(
                                  child: WeatherCard(cityWeather: weather),
                                  onTap: () => Navigator.of(context).push(
                                      _goToWeatherRoute(WeatherDetailsScreen(
                                          weather: weather,
                                          fromProvider: fromHome))),
                                  onTapDown: (TapDownDetails details) {
                                    _tapDownPosition = details.globalPosition;
                                  },
                                  onLongPress: () {
                                    final RenderObject? overlay =
                                        Overlay.of(context)
                                            .context
                                            .findRenderObject();
                                    showMenu(
                                      context: context,
                                      position: RelativeRect.fromLTRB(
                                        _tapDownPosition.dx,
                                        _tapDownPosition.dy,
                                        overlay!.semanticBounds.size.width -
                                            _tapDownPosition.dx,
                                        overlay.semanticBounds.size.height -
                                            _tapDownPosition.dy,
                                      ),
                                      items: <PopupMenuEntry>[
                                        PopupMenuItem(
                                          value: weather,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.delete,
                                                  color: Colors.red),
                                              Text(
                                                  AppLocalizations.of(context)!
                                                      .delete,
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ).then((city) {
                                      if (city != null)
                                        moorDatabase.deleteWeather(city);
                                    });
                                  });
                            }, error: (e, st) {
                              late Offset _tapDownPosition;
                              return InkWell(
                                  child: WeatherCard(cityWeather: weather),
                                  onTap: () => Navigator.of(context).push(
                                      _goToWeatherRoute(WeatherDetailsScreen(
                                          weather: weather,
                                          fromProvider: fromHome))),
                                  onTapDown: (TapDownDetails details) {
                                    _tapDownPosition = details.globalPosition;
                                  },
                                  onLongPress: () {
                                    final RenderObject? overlay =
                                        Overlay.of(context)
                                            .context
                                            .findRenderObject();
                                    showMenu(
                                      context: context,
                                      position: RelativeRect.fromLTRB(
                                        _tapDownPosition.dx,
                                        _tapDownPosition.dy,
                                        overlay!.semanticBounds.size.width -
                                            _tapDownPosition.dx,
                                        overlay.semanticBounds.size.height -
                                            _tapDownPosition.dy,
                                      ),
                                      items: <PopupMenuEntry>[
                                        PopupMenuItem(
                                          value: weather,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.delete,
                                                  color: Colors.red),
                                              Text(
                                                  AppLocalizations.of(context)!
                                                      .delete,
                                                  style: TextStyle(
                                                      color: Colors.red)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ).then((city) {
                                      if (city != null)
                                        moorDatabase.deleteWeather(city);
                                    });
                                  });
                            });
                          }),
                    );
            },
            loading: () => WeatherCard(),
            error: (e, st) => Text('Error $e'));
  }

  Route _goToWeatherRoute(weatherScreen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => weatherScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  Route _goToSettings() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SettingsScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
