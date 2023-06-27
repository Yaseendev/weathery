import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weathery/utils/WeatherIconMapper.dart';
import 'package:weathery/utils/providers.dart';
import '../utils/converters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourlyForecastCard extends ConsumerWidget with WeatherIconsMapper {
  final hourlyForecast;
  HourlyForecastCard(this.hourlyForecast);

  @override
  Widget build(BuildContext context, ref) {
    final tempUnit = ref.watch(temperatureUnitProvider);
    final _appThemeState = ref.watch(appThemeStateProvider);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: BlurryContainer(
        borderRadius: BorderRadius.circular(20),
        color: ref
            .read(appThemeProvider)
            .getContainerColor(context, _appThemeState),
        padding: EdgeInsets.all(8),
        height: 170,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: this.hourlyForecast.length,
          separatorBuilder: (context, index) => Container(
            width: 30,
          ),
          padding: EdgeInsets.only(left: 10, right: 10),
          itemBuilder: (context, index) {
            final item = this.hourlyForecast[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                index == 0
                    ? Text('${AppLocalizations.of(context)?.now}     ',
                        style: TextStyle(
                            fontSize: 55.sp, fontWeight: FontWeight.w500))
                    : Text(
                        DateFormat('hh:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                item['dt'] * 1000)),
                        style: TextStyle(fontSize: 55.sp)),
                Text(
                    '${Temperature(intToDouble(item['temp'])).as(tempUnit).round()}º',
                    style: TextStyle(
                        fontSize: 100.sp, fontWeight: FontWeight.w600)),
                Icon(getIconData(item['weather'][0]['icon']), size: 115.sp),
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
