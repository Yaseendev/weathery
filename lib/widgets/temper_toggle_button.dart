import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/utils/converters.dart';
import 'package:weathery/utils/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemperToggleButton extends ConsumerWidget {
  final List<String> values;
  TemperToggleButton({required this.values});

  @override
  Widget build(BuildContext context, ref) {
    double widthFactor;
    double width = MediaQuery.of(context).size.width;
    values.length < 3 ? widthFactor = .7 : widthFactor = .99;
    final _appThemeState = ref.watch(appThemeStateProvider);
    final sharedPreferences = ref.watch(sharedPreferencesProvider);
    final tempProviderVal = ref.watch(temperatureUnitProvider);
    return Container(
      width: width * widthFactor,
      height: width * .13,
      child: Stack(
        children: [
          Container(
            width: width * widthFactor,
            height: width * .13,
            decoration: ShapeDecoration(
                color: ref
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
                        ref.read(temperatureUnitProvider.notifier).update((state) => TemperatureUnit.celsius);
                        sharedPreferences.setInt(
                            'unit', TemperatureUnit.celsius.index);
                        break;
                      case 1:
                        ref.read(temperatureUnitProvider.notifier).state =
                            TemperatureUnit.fahrenheit;
                        sharedPreferences.setInt(
                            'unit', TemperatureUnit.fahrenheit.index);
                        break;
                      case 2:
                        ref.read(temperatureUnitProvider.notifier).state =
                            TemperatureUnit.kelvin;
                        sharedPreferences.setInt(
                            'unit', TemperatureUnit.kelvin.index);
                        break;
                      default:
                        break;
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 88.h),
                    child: FittedBox(
                      child: AutoSizeText(
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
          ),
          AnimatedAlign(
            alignment: tempProviderVal == TemperatureUnit.celsius
                ? Alignment.centerLeft
                : tempProviderVal == TemperatureUnit.fahrenheit
                    ? Alignment.center
                    : Alignment.centerRight,
            duration: Duration(milliseconds: 350),
            curve: Curves.ease,
            child: Container(
              alignment: Alignment.center,
              width: width * .35,
              height: width * .13,
              decoration: ShapeDecoration(
                  color: ref
                      .read(appThemeProvider)
                      .getToggleButtonColor(context, _appThemeState),
                  shadows: ref
                      .read(appThemeProvider)
                      .getShadow(context, _appThemeState),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Text(
                tempProviderVal == TemperatureUnit.celsius
                    ? values[0]
                    : tempProviderVal == TemperatureUnit.fahrenheit
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
