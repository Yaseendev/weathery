import 'package:flutter/material.dart';
import 'package:weathery/utils/WeatherIconMapper.dart';
import 'package:weathery/utils/converters.dart';
import 'package:weathery/database/moorDB.dart';
import 'package:weathery/utils/providers.dart';
import 'value_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:progress_indicators/progress_indicators.dart';

class MainWeatherCard extends ConsumerWidget with WeatherIconsMapper {
  final Weather cityWeather;
  MainWeatherCard({this.cityWeather});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tempUnit = watch(temperatureUnitProvider);
    final _appLocaleState = watch(appLocaleStateProvider.state);
    return Container(
      margin: EdgeInsets.only(
        left: 8.0,
        right: 8,
        bottom: 2,
      ),
      decoration: cityWeather != null
          ? BoxDecoration(
              image: DecorationImage(
                image: AssetImage(getImageUri(cityWeather.iconCode)),
                fit: BoxFit.cover,
              ),
              color: Colors.grey[500],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            )
          : BoxDecoration(
              color: Colors.grey[500],
              borderRadius: BorderRadius.all(Radius.circular(30))),
      height: 270,
      width: 300,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: cityWeather != null
                      ? ConstrainedBox(
                          constraints:
                              BoxConstraints.expand(height: 200, width: 200),
                          child: Icon(
                            getIconData(cityWeather.iconCode),
                            color: Colors.white,
                            size: 130,
                          ),
                        )
                      : GlowingProgressIndicator(
                          child: CircleAvatar(
                            backgroundColor: Colors.black38,
                            radius: 85,
                          ),
                        ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(height: 15),
                    cityWeather != null
                        ? Row(
                            children: [
                              Text(
                                _appLocaleState
                                    ? '${cityWeather.cityName} '
                                    : '${cityWeather.arCityName} ',
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(Icons.gps_fixed_rounded,
                                  color: Colors.white70),
                            ],
                          )
                        : ScalingText(AppLocalizations.of(context).loading,
                            style: TextStyle(fontSize: 25)),
                    SizedBox(width: 30),
                    cityWeather != null
                        ? Text(
                            '${Temperature(cityWeather.temperature).as(tempUnit.state).round()}' +
                                Temperature.getTemperSympol(tempUnit.state),
                            style: TextStyle(fontSize: 60, color: Colors.white),
                          )
                        : HeartbeatProgressIndicator(
                            child: Text(AppLocalizations.of(context).loading,
                                style: TextStyle(fontSize: 20)),
                          ),
                    SizedBox(),
                    cityWeather != null
                        ? Text(
                            _appLocaleState
                                ? cityWeather.description
                                : cityWeather.arDesc,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          )
                        : FadingText(AppLocalizations.of(context).loading,
                            style: TextStyle(fontSize: 20)),
                  ],
                ),
                SizedBox(),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueTile(
                  AppLocalizations.of(context).high,
                  cityWeather != null
                      ? Text(
                          '${Temperature(cityWeather.maxTemperature).as(tempUnit.state).round()}' +
                              Temperature.getTemperSympol(tempUnit.state),
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      : JumpingDotsProgressIndicator(
                          fontSize: 20.0,
                        ),
                  imageUri: 'assets/images/tempr.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Center(
                      child: Container(
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  )),
                ),
                ValueTile(
                  AppLocalizations.of(context).low,
                  cityWeather != null
                      ? Text(
                          '${Temperature(cityWeather.minTemperature).as(tempUnit.state).round()}' +
                              Temperature.getTemperSympol(tempUnit.state),
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      : JumpingDotsProgressIndicator(
                          fontSize: 20.0,
                        ),
                  imageUri: 'assets/images/tempr.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Center(
                      child: Container(
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  )),
                ),
                ValueTile(
                  AppLocalizations.of(context).sunrise,
                  cityWeather != null
                      ? Text(
                          DateFormat('hh:mm a').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  cityWeather.sunrise * 1000)),
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      : JumpingDotsProgressIndicator(
                          fontSize: 20.0,
                        ),
                  imageUri: 'assets/images/sunrise.png',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Center(
                      child: Container(
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  )),
                ),
                ValueTile(
                  AppLocalizations.of(context).sunset,
                  cityWeather != null
                      ? Text(
                          DateFormat('hh:mm a').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  cityWeather.sunset * 1000)),
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        )
                      : JumpingDotsProgressIndicator(
                          fontSize: 20.0,
                        ),
                  imageUri: 'assets/images/sunset.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
