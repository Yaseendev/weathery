import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/providers.dart';

class ThemeToggleButton extends ConsumerWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  ThemeToggleButton({this.values, this.onToggleCallback});

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    double width = MediaQuery.of(context).size.width;
    final _appThemeState = watch(appThemeStateProvider.state);
    return Container(
      width: width * .7,
      height: width * .13,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              onToggleCallback(1);
            },
            child: Container(
              width: width * .65,
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
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .1),
                    child: Text(
                        values[index],
                        style: TextStyle(
                            fontSize: width * .05,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF918f95)),
                      ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            alignment:
                _appThemeState ? Alignment.centerRight : Alignment.centerLeft,
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
                _appThemeState ? values[1] : values[0],
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
