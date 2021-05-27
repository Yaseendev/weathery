import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/database/moorDB.dart';
import 'package:weathery/utils/WeatherIconMapper.dart';
import 'package:weathery/utils/converters.dart';
import 'package:weathery/utils/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherCard extends ConsumerWidget with WeatherIconsMapper {
  final Weather cityWeather;
  WeatherCard({this.cityWeather});
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tempUnit = watch(temperatureUnitProvider);
    final _appLocaleState = watch(appLocaleStateProvider.state);
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        left: 8.0,
        right: 8,
        bottom: 8,
        top: 3,
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
      height: width * .483,
      width: width * .85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          cityWeather != null
              ? Align(
                  alignment: Alignment(-0.8, 0.8),
                  widthFactor: 0.6,
                  heightFactor: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      getIconData(cityWeather.iconCode),
                      color: Colors.white,
                      size: 375.sp,
                    ),
                  ),
                )
              : GlowingProgressIndicator(
                  child: CircleAvatar(
                    backgroundColor: Colors.black38,
                    radius: 75,
                  ),
                ),
          SizedBox(width: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                cityWeather != null
                    ? Container(
                        width: ScreenUtil().setWidth(375),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: AutoSizeText(
                            _appLocaleState
                                ? '${cityWeather.cityName} '
                                : '${cityWeather.arCityName} ',
                            wrapWords: true,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                fontSize: 83.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : ScalingText(AppLocalizations.of(context).loading,
                        style: TextStyle(fontSize: 55.sp)),
                SizedBox(width: 30),
                cityWeather != null
                    ? Container(
                        width: ScreenUtil().setWidth(475),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: AutoSizeText(
                            '${Temperature(cityWeather.temperature).as(tempUnit.state).round()}' +
                                Temperature.getTemperSympol(tempUnit.state),
                            style: TextStyle(
                                fontSize: 130.sp, color: Colors.white),
                          ),
                        ),
                      )
                    : ScalingText(AppLocalizations.of(context).loading,
                        style: TextStyle(fontSize: 55.sp)),
                SizedBox(),
                cityWeather != null
                    ? Text(
                        _appLocaleState
                            ? cityWeather.description
                            : cityWeather.arDesc,
                        style: TextStyle(fontSize: 55.sp, color: Colors.white),
                      )
                    : ScalingText(
                        AppLocalizations.of(context).loading,
                        style: TextStyle(fontSize: 55.sp),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
