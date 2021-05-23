import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/utils/converters.dart';
import 'package:weathery/utils/providers.dart';

class TemperToggleButton extends ConsumerWidget {
  final List<String> values;
  TemperToggleButton({this.values});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double widthFactor;
    double width = MediaQuery.of(context).size.width;
    values.length < 3 ? widthFactor = .7 : widthFactor = .99;
    final _appThemeState = watch(appThemeStateProvider.state);
    final sharedPreferences = watch(sharedPreferencesProvider);
    final tempProviderVal = watch(temperatureUnitProvider);
    return Container(
      width: width * widthFactor,
      height: width * .13,
      child: Stack(
        children: [
          Container(
            width: width * widthFactor,
            height: width * .13,
            decoration: ShapeDecoration(
                color: context
                    .read(appThemeProvider)
                    .getToggleBackgroundColor(context, _appThemeState),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * .1))),
            child: Row(
              children: List.generate(
                values.length,
                (index) => GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        context.read(temperatureUnitProvider).state =
                            TemperatureUnit.celsius;
                        sharedPreferences.setInt(
                            'unit', TemperatureUnit.celsius.index);
                        break;
                      case 1:
                        context.read(temperatureUnitProvider).state =
                            TemperatureUnit.fahrenheit;
                        sharedPreferences.setInt(
                            'unit', TemperatureUnit.fahrenheit.index);
                        break;
                      case 2:
                        context.read(temperatureUnitProvider).state =
                            TemperatureUnit.kelvin;
                        sharedPreferences.setInt(
                            'unit', TemperatureUnit.kelvin.index);
                        break;
                      default:
                        break;
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .099),
                    child: Text(
                      values[index],
                      style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF918f95)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            alignment: tempProviderVal.state == TemperatureUnit.celsius
                ? Alignment.centerLeft
                : tempProviderVal.state == TemperatureUnit.fahrenheit
                    ? Alignment.center
                    : Alignment.centerRight,
            duration: Duration(milliseconds: 350),
            curve: Curves.ease,
            child: Container(
              alignment: Alignment.center,
              width: width * .35,
              height: width * .13,
              decoration: ShapeDecoration(
                  color: context
                      .read(appThemeProvider)
                      .getToggleButtonColor(context, _appThemeState),
                  shadows: context
                      .read(appThemeProvider)
                      .getShadow(context, _appThemeState),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Text(
                tempProviderVal.state == TemperatureUnit.celsius
                    ? values[0]
                    : tempProviderVal.state == TemperatureUnit.fahrenheit
                        ? values[1]
                        : values[2],
                style: TextStyle(
                    fontSize: width * .045, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
