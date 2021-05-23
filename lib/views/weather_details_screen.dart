import 'dart:convert';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/utils/WeatherIconMapper.dart';
import 'package:weathery/database/moorDB.dart';
import 'package:weathery/utils/providers.dart';
import 'package:weathery/views/settings_screen.dart';
import 'package:weathery/widgets/daily_forecast_card.dart';
import 'package:weathery/widgets/hourly_forecast_card.dart';
import '../widgets/weatherInfo_card.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import '../utils/converters.dart';

class WeatherDetailsScreen extends ConsumerWidget with WeatherIconsMapper {
  final Weather weather;
  final StateProvider<bool> fromProvider;
  WeatherDetailsScreen({this.weather, this.fromProvider});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tempUnit = watch(temperatureUnitProvider);
    final moorDatabase = watch(moorDatabaseProvider);
    final displayAdd = watch(fromProvider);
    final _appLocaleState = watch(appLocaleStateProvider.state);
    final _appThemeState = watch(appThemeStateProvider.state);
    return Scaffold(
      body: ProviderListener<StateController<bool>>(
        provider: fromProvider,
        onChange: (context, displayAddState) {
          Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
            AppLocalizations.of(context).cityAddition(
                _appLocaleState ? weather.cityName : weather.arCityName),
            style: TextStyle(fontSize: 20),
          )));
        },
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(getImageUri(weather.iconCode)),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: 32,
                            color: Colors.grey,
                          ),
                          onPressed: () => Navigator.of(context).pop()),
                      displayAdd.state
                          ? IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                size: 32,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                moorDatabase
                                    .insertWeather(weather)
                                    .whenComplete(() {
                                  context.read(fromProvider).state = false;
                                 if (!context.read(initStreamProvider).state)context.read(initStreamProvider).state = true;
                                });
                              })
                          : Container(),
                      IconButton(
                          icon: Icon(
                            Icons.settings,
                            size: 32,
                            color: Colors.grey,
                          ),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (ctx) => SettingsScreen()))),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    child: BlurryContainer(
                      borderRadius: BorderRadius.circular(20),
                      bgColor: context
                          .read(appThemeProvider)
                          .getContainerColor(context, _appThemeState),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${_appLocaleState ? weather.cityName : weather.arCityName}, ${weather.countryName}',
                              style: TextStyle(
                                fontSize: 30,
                                letterSpacing: 5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(DateFormat('EEEE').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weather.time * 1000))),
                                Text(DateFormat('yMd').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weather.time * 1000))),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Align(
                                        alignment: Alignment(-0.5, 1.0),
                                        widthFactor: 0.6,
                                        heightFactor: 0.5,
                                        child: Icon(
                                          getIconData(weather.iconCode),
                                          size: 100,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${Temperature(weather.temperature).as(tempUnit.state).round()}º',
                                            style: TextStyle(
                                              fontSize: 60,
                                            ),
                                          ),
                                          Text(
                                            '${Temperature(weather.maxTemperature).as(tempUnit.state).round()}º/${Temperature(weather.minTemperature).as(tempUnit.state).round()}º   ',
                                            style: TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 23),
                                  Text(
                                    _appLocaleState
                                        ? weather.description
                                        : weather.arDesc,
                                    style: TextStyle(
                                      letterSpacing: 4,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/tempr.png',
                              scale: 0.3,
                              height: 40,
                              color: context
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: Text(
                              AppLocalizations.of(context).feelsLike,
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            value: Text(
                                '${Temperature(weather.feelslike).as(tempUnit.state).round()}º',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/sunrise.png',
                              scale: 0.3,
                              height: 40,
                              color: context
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: Text(AppLocalizations.of(context).sunrise,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                            value: Text(
                                DateFormat('hh:mm a').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weather.sunrise * 1000)),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/sunset.png',
                              scale: 0.3,
                              height: 40,
                              color: context
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: Text(AppLocalizations.of(context).sunset,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            value: Text(
                                DateFormat('hh:mm a').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weather.sunset * 1000)),
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: WindIcon(
                              degree: weather.windDegree,
                              size: 40,
                            ),
                            title: Text(AppLocalizations.of(context).windSpeed,
                                style: TextStyle(
                                    fontSize: 13.5,
                                    fontWeight: FontWeight.w500)),
                            value: Text('${weather.windSpeed.floor()} km/h',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: Icon(
                              WeatherIcons.humidity,
                              size: 30,
                            ),
                            title: Text(AppLocalizations.of(context).humidity,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                            value: Text('${weather.humidity}%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: Icon(
                              Icons.visibility,
                              size: 40,
                            ),
                            title: Text(AppLocalizations.of(context).visibility,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            value: Text('${weather.visibility / 1000} km',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/pressure.png',
                              scale: 0.3,
                              height: 40,
                              color: context
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: Text(AppLocalizations.of(context).pressure,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            value: Text('${weather.pressure} mb',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/dewpoint.png',
                              scale: 0.3,
                              height: 40,
                              color: context
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: Text(AppLocalizations.of(context).dewPoint,
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w500)),
                            value: Text('${weather.dewPoint.ceil()}º',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: Icon(
                              Icons.wb_sunny_rounded,
                              size: 40,
                            ),
                            title: Text(AppLocalizations.of(context).uvi,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            value: Text('${weather.uvi.ceil()}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    child: HourlyForecastCard(
                      jsonDecode(weather.hourlyForecast),
                    ),
                  ),
                  DailyForecastCard(jsonDecode(weather.dailyForecast)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
