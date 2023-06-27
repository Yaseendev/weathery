import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherDetailsScreen extends ConsumerWidget with WeatherIconsMapper {
  final Weather? weather;
  final StateProvider<bool> fromProvider;
  WeatherDetailsScreen({
    required this.weather,
    required this.fromProvider,
  });

  @override
  Widget build(BuildContext context, ref) {
    final tempUnit = ref.watch(temperatureUnitProvider);
    final moorDatabase = ref.watch(moorDatabaseProvider);
    final displayAdd = ref.watch(fromProvider);
    final _appLocaleState = ref.watch(appLocaleStateProvider);
    final _appThemeState = ref.watch(appThemeStateProvider);
    ref.listen(fromProvider, (previous, next) { 
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            AppLocalizations.of(context)!.cityAddition(
                _appLocaleState ? weather!.cityName : weather!.arCityName),
            style: TextStyle(fontSize: 60.sp),
          )));
    });
    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(getImageUri(weather!.iconCode)),
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
                      displayAdd
                          ? IconButton(
                              icon: Icon(
                                Icons.add_circle,
                                size: 32,
                                color: Colors.grey,
                              ),
                              onPressed: () {
                                moorDatabase
                                    .insertWeather(weather!)
                                    .whenComplete(() {
                                  ref.read(fromProvider.notifier).update((state) => false);
                                  if (!ref.read(initStreamProvider))
                                    ref.read(initStreamProvider.notifier).update((state) => true);
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
                      color: ref
                          .read(appThemeProvider)
                          .getContainerColor(context, _appThemeState),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${_appLocaleState ? weather?.cityName : weather?.arCityName}, ${weather?.countryName}',
                              style: TextStyle(
                                fontSize: 85.sp,
                                letterSpacing: 5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(DateFormat('EEEE').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weather!.time * 1000))),
                                Text(DateFormat('yMd').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weather!.time * 1000))),
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
                                          getIconData(weather!.iconCode),
                                          size: 290.sp,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '${Temperature(weather!.temperature).as(tempUnit).round()}º',
                                            style: TextStyle(
                                              fontSize: 168.sp,
                                            ),
                                          ),
                                          Text(
                                            '${Temperature(weather!.maxTemperature).as(tempUnit).round()}º/${Temperature(weather!.minTemperature).as(tempUnit).round()}º   ',
                                            style: TextStyle(
                                              fontSize: 58.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 23),
                                  Text(
                                    _appLocaleState
                                        ? weather!.description
                                        : weather!.arDesc,
                                    style: TextStyle(
                                      letterSpacing: 4,
                                      fontSize: 48.sp,
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
                    width: ScreenUtil().screenWidth,
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
                              height: ScreenUtil().setHeight(100),
                              color: ref
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: AutoSizeText(
                              AppLocalizations.of(context)!.feelsLike,
                              locale: ref
                                  .read(appLocaleProvider)
                                  .getAppLocale(context, _appLocaleState),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(48),
                                  fontWeight: FontWeight.w500),
                            ),
                            value: Container(
                              width: ScreenUtil().setWidth(110),
                              height: ScreenUtil().setHeight(50),
                              child: FittedBox(
                                child: AutoSizeText(
                                    '${Temperature(weather!.feelslike).as(tempUnit).round()}º',
                                    locale: ref
                                        .read(appLocaleProvider)
                                        .getAppLocale(context, _appLocaleState),
                                    style: TextStyle(
                                        fontSize: 65.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/sunrise.png',
                              scale: 0.3,
                              height: ScreenUtil().setHeight(100),
                              color: ref
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: AutoSizeText(
                                AppLocalizations.of(context)!.sunrise,
                                locale: ref
                                    .read(appLocaleProvider)
                                    .getAppLocale(context, _appLocaleState),
                                style: TextStyle(
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w500)),
                            value: FittedBox(
                              child: AutoSizeText(
                                  DateFormat('hh:mm a').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          weather!.sunrise * 1000)),
                                  locale: ref
                                      .read(appLocaleProvider)
                                      .getAppLocale(context, _appLocaleState),
                                  style: TextStyle(
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/sunset.png',
                              scale: 0.3,
                              height: ScreenUtil().setHeight(100),
                              color: ref
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: AutoSizeText(
                                AppLocalizations.of(context)!.sunset,
                                locale: ref
                                    .read(appLocaleProvider)
                                    .getAppLocale(context, _appLocaleState),
                                style: TextStyle(
                                    fontSize: 50.sp,
                                    fontWeight: FontWeight.w500)),
                            value: FittedBox(
                              child: AutoSizeText(
                                  DateFormat('hh:mm a').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          weather!.sunset * 1000)),
                                  locale: ref
                                      .read(appLocaleProvider)
                                      .getAppLocale(context, _appLocaleState),
                                  style: TextStyle(
                                      fontSize: 48.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          WeatherInfoCard(
                            cardIcon: WindIcon(
                              degree: weather!.windDegree,
                              size: 110.sp,
                            ),
                            title: Align(
                              alignment: Alignment(-0.3, 0.5),
                              widthFactor: 0.6,
                              heightFactor: 0.5,
                              child: AutoSizeText(
                                  AppLocalizations.of(context)!.windSpeed,
                                  locale: ref
                                      .read(appLocaleProvider)
                                      .getAppLocale(context, _appLocaleState),
                                  style: TextStyle(
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                            value: Container(
                              width: ScreenUtil().setWidth(100),
                              child: Container(
                                height: ScreenUtil().setHeight(50),
                                width: ScreenUtil().setWidth(35),
                                child: FittedBox(
                                  child: AutoSizeText(
                                      '${weather?.windSpeed.floor()} km/h',
                                      locale: ref
                                          .read(appLocaleProvider)
                                          .getAppLocale(
                                              context, _appLocaleState),
                                      style: TextStyle(
                                          fontSize: 40.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          WeatherInfoCard(
                            cardIcon: Icon(
                              WeatherIcons.humidity,
                              size: 30,
                            ),
                            title: AutoSizeText(
                                AppLocalizations.of(context)!.humidity,
                                locale: ref
                                    .read(appLocaleProvider)
                                    .getAppLocale(context, _appLocaleState),
                                style: TextStyle(
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w500)),
                            value: FittedBox(
                              child: AutoSizeText('${weather?.humidity}%',
                                  locale: ref
                                      .read(appLocaleProvider)
                                      .getAppLocale(context, _appLocaleState),
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(width: 5),
                          WeatherInfoCard(
                            cardIcon: Icon(
                              Icons.visibility,
                              size: 40,
                            ),
                            title: AutoSizeText(
                                AppLocalizations.of(context)!.visibility,
                                locale: ref
                                    .read(appLocaleProvider)
                                    .getAppLocale(context, _appLocaleState),
                                style: TextStyle(
                                    fontSize: 50.sp,
                                    fontWeight: FontWeight.w500)),
                            value: Container(
                              height: ScreenUtil().setHeight(50),
                              child: FittedBox(
                                child: AutoSizeText(
                                    '${weather!.visibility / 1000} km',
                                    locale: ref
                                        .read(appLocaleProvider)
                                        .getAppLocale(context, _appLocaleState),
                                    style: TextStyle(
                                        fontSize: 50.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/pressure.png',
                              scale: 0.3,
                              height: ScreenUtil().setHeight(100),
                              color: ref
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: AutoSizeText(
                                AppLocalizations.of(context)!.pressure,
                                locale: ref
                                    .read(appLocaleProvider)
                                    .getAppLocale(context, _appLocaleState),
                                style: TextStyle(
                                    fontSize: 50.sp,
                                    fontWeight: FontWeight.w500)),
                            value: FittedBox(
                              child: AutoSizeText('${weather?.pressure} mb',
                                  locale: ref
                                      .read(appLocaleProvider)
                                      .getAppLocale(context, _appLocaleState),
                                  style: TextStyle(
                                      fontSize: 55.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          WeatherInfoCard(
                            cardIcon: Image.asset(
                              'assets/images/dewpoint.png',
                              scale: 0.3,
                              height: ScreenUtil().setHeight(100),
                              color: ref
                                  .read(appThemeProvider)
                                  .getImageIconColor(context, _appThemeState),
                            ),
                            title: AutoSizeText(
                                AppLocalizations.of(context)!.dewPoint,
                                locale: ref
                                    .read(appLocaleProvider)
                                    .getAppLocale(context, _appLocaleState),
                                style: TextStyle(
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w500)),
                            value: FittedBox(
                              child: AutoSizeText(
                                  '${weather?.dewPoint.ceil()}º',
                                  locale: ref
                                      .read(appLocaleProvider)
                                      .getAppLocale(context, _appLocaleState),
                                  style: TextStyle(
                                      fontSize: 55.sp,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          WeatherInfoCard(
                            cardIcon: Icon(
                              Icons.wb_sunny_rounded,
                              size: 40,
                            ),
                            title: AutoSizeText(
                                AppLocalizations.of(context)!.uvi,
                                locale: ref
                                    .read(appLocaleProvider)
                                    .getAppLocale(context, _appLocaleState),
                                style: TextStyle(
                                    fontSize: 50.sp,
                                    fontWeight: FontWeight.w500)),
                            value: Container(
                              width: ScreenUtil().setWidth(35),
                              height: ScreenUtil().setHeight(50),
                              child: FittedBox(
                                child: AutoSizeText('${weather?.uvi.ceil()}',
                                    locale: ref
                                        .read(appLocaleProvider)
                                        .getAppLocale(context, _appLocaleState),
                                    style: TextStyle(
                                        fontSize: 55.sp,
                                        fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil().screenWidth,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    child: HourlyForecastCard(
                      jsonDecode(weather!.hourlyForecast),
                    ),
                  ),
                  DailyForecastCard(jsonDecode(weather!.dailyForecast)),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
