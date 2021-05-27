import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/utils/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoCard extends StatelessWidget {
  final cardIcon;
  final Widget title;
  final Widget value;

  WeatherInfoCard({this.cardIcon, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final _appThemeState = watch(appThemeStateProvider.state);
      return BlurryContainer(
        borderRadius: BorderRadius.circular(20),
        bgColor: context
            .read(appThemeProvider)
            .getContainerColor(context, _appThemeState),
        height: ScreenUtil().setHeight(350),
        width: ScreenUtil().setWidth(300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardIcon,
            FittedBox(child: title),
 value,
          ],
        ),
      );
    });
  }
}
