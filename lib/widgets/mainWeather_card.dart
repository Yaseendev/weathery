import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainWeatherCard extends ConsumerWidget with WeatherIconsMapper {
  final Weather cityWeather;
  MainWeatherCard({this.cityWeather});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double width = MediaQuery.of(context).size.width;
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
      height: width * .65,
      width: width,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: cityWeather != null
                      ? 
                      Align(
                          alignment: Alignment(-0.3, 0.5),
                          widthFactor: 0.6,
                          heightFactor: 0.5,
                          child: Icon(
                            getIconData(cityWeather.iconCode),
                            color: Colors.white,
                            size: ScreenUtil().setSp(400),
                          ),
                        )
                      : GlowingProgressIndicator(
                          child: CircleAvatar(
                            backgroundColor: Colors.black38,
                            radius: 85,
                          ),
                        ),
                ),
                SizedBox(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 1),
                    cityWeather != null
                        ? Row(
                            children: [
                              Icon(Icons.gps_fixed_rounded,
                                  color: Colors.white70),
                              Container(
                                width: ScreenUtil().setWidth(400),
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: AutoSizeText(
                                    _appLocaleState
                                        ? '${cityWeather.cityName} '
                                        : '${cityWeather.arCityName} ',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(75),
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ScalingText(AppLocalizations.of(context).loading,
                            style: TextStyle(fontSize: 25)),
                    cityWeather != null
                        ? Container(
                            width: ScreenUtil().setWidth(320),
                            child: FittedBox(
                              child: AutoSizeText(
                                '${Temperature(cityWeather.temperature).as(tempUnit.state).round()}' +
                                    Temperature.getTemperSympol(tempUnit.state),
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(180),
                                    color: Colors.white),
                              ),
                            ),
                          )
                        : HeartbeatProgressIndicator(
                            child: Text(AppLocalizations.of(context).loading,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(55))),
                          ),
                    cityWeather != null
                        ? Container(
                            width: ScreenUtil().setWidth(250),
                            height: ScreenUtil().setHeight(84),
                            child: FittedBox(
                              child: AutoSizeText(
                                _appLocaleState
                                    ? cityWeather.description
                                    : cityWeather.arDesc,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(55),
                                    color: Colors.white),
                              ),
                            ),
                          )
                        : FadingText(AppLocalizations.of(context).loading,
                            style: TextStyle(fontSize: ScreenUtil().setSp(55))),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ValueTile(
                      AppLocalizations.of(context).high,
                      cityWeather != null
                          ? Container(
                              width: ScreenUtil().setWidth(160),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: AutoSizeText(
                                  '${Temperature(cityWeather.maxTemperature).as(tempUnit.state).round()}' +
                                      Temperature.getTemperSympol(
                                          tempUnit.state),
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            )
                          : JumpingDotsProgressIndicator(
                              fontSize: ScreenUtil().setSp(55),
                            ),
                      imageUri: 'assets/images/tempr.png',
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(30),
                    ),
                    Center(
                        child: Container(
                      width: ScreenUtil().setWidth(3),
                      height: ScreenUtil().setHeight(100),
                      color: Colors.white,
                    )),
                  ],
                ),
                Row(
                  children: [
                    ValueTile(
                      AppLocalizations.of(context).low,
                      cityWeather != null
                          ? Text(
                              '${Temperature(cityWeather.minTemperature).as(tempUnit.state).round()}' +
                                  Temperature.getTemperSympol(tempUnit.state),
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          : JumpingDotsProgressIndicator(
                              fontSize: ScreenUtil().setSp(55),
                            ),
                      imageUri: 'assets/images/tempr.png',
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(30),
                    ),
                    Center(
                        child: Container(
                      width: ScreenUtil().setWidth(3),
                      height: ScreenUtil().setHeight(100),
                      color: Colors.white,
                    )),
                  ],
                ),
                Row(
                  children: [
                    ValueTile(
                      AppLocalizations.of(context).sunrise,
                      cityWeather != null
                          ? Text(
                              DateFormat('hh:mm a').format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      cityWeather.sunrise * 1000)),
                              overflow: TextOverflow.clip,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            )
                          : JumpingDotsProgressIndicator(
                              fontSize: ScreenUtil().setSp(55),
                            ),
                      imageUri: 'assets/images/sunrise.png',
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(30),
                    ),
                    Center(
                        child: Container(
                      width: ScreenUtil().setWidth(3),
                      height: ScreenUtil().setHeight(100),
                      color: Colors.white,
                    )),
                  ],
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
                          fontSize: ScreenUtil().setSp(55),
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
