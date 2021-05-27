import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weathery/utils/WeatherIconMapper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/utils/converters.dart';
import 'package:weathery/utils/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DailyForecastCard extends ConsumerWidget with WeatherIconsMapper {
  final dailyForecast;
  DailyForecastCard(this.dailyForecast);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final tempUnit = watch(temperatureUnitProvider);
    final _appThemeState = watch(appThemeStateProvider.state);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: BlurryContainer(
        borderRadius: BorderRadius.circular(20),
        bgColor: context
            .read(appThemeProvider)
            .getContainerColor(context, _appThemeState),
        padding: EdgeInsets.all(8),
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: this.dailyForecast.length,
          separatorBuilder: (context, index) => Container(
            width: 30,
          ),
          padding: EdgeInsets.only(left: 10, right: 10),
          itemBuilder: (context, index) {
            final item = this.dailyForecast[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                index == 0
                    ? Text('${AppLocalizations.of(context).today}    ',
                        style: TextStyle(
                            fontSize: 55.sp, fontWeight: FontWeight.w500))
                    : Text(
                        DateFormat('EEE d').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                item['dt'] * 1000)),
                        style: TextStyle(fontSize: 55.sp)),
                Text(
                    '${Temperature(intToDouble(item['temp']['max'])).as(tempUnit.state).round()}º',
                    style: TextStyle(
                        fontSize: 100.sp, fontWeight: FontWeight.w600)),
                Text(
                    '${Temperature(intToDouble(item['temp']['min'])).as(tempUnit.state).round()}º',
                    style: TextStyle(fontSize: 55.sp)),
                Icon(getIconData(item['weather'][0]['icon']), size: 40),
                SizedBox(height: 12),
                Row(children: [
                  Icon(
                    WeatherIcons.humidity,
                    color: Colors.lightBlueAccent,
                  ),
                  Text(' ${item['pop'].ceil()}%',
                      style: TextStyle(fontSize: 55.sp))
                ]),
              ],
            );
          },
        ),
      ),
    );
  }
}
