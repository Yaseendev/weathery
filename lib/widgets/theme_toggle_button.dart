import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/providers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeToggleButton extends ConsumerWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  ThemeToggleButton({required this.values, required this.onToggleCallback});

  @override
  Widget build(BuildContext context, ref) {
    double width = MediaQuery.of(context).size.width;
    final _appThemeState = ref.watch(appThemeStateProvider);
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
                  color: ref
                      .read(appThemeProvider)
                      .getToggleBackgroundColor(context, _appThemeState),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Row(
                children: List.generate(
                  values.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 95.h),
                    child: FittedBox(
                      child: AutoSizeText(
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
                  color: ref
                      .read(appThemeProvider)
                      .getToggleButtonColor(context, _appThemeState),
                  shadows: ref
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
