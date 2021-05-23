import 'package:flutter/material.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/utils/providers.dart';

class WeatherInfoCard extends StatelessWidget {
  final cardIcon;
  final Text title;
  final Text value;

  WeatherInfoCard({this.cardIcon, this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final _appThemeState = watch(appThemeStateProvider.state);
        return BlurryContainer(
        borderRadius: BorderRadius.circular(20),
        bgColor: context.read(appThemeProvider).getContainerColor(context, _appThemeState),
        height: 130,
        width: 115,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            cardIcon,
            title,
            value,
          ],
        ),
      );}
    );
  }
}
