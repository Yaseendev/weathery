import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/utils/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherInfoCard extends StatelessWidget {
  final cardIcon;
  final Widget title;
  final Widget value;

  WeatherInfoCard({
    this.cardIcon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final _appThemeState = ref.watch(appThemeStateProvider);
      return BlurryContainer(
        borderRadius: BorderRadius.circular(20),
        
        color: ref
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
