import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers.dart';

class AppTheme {
  static ThemeData _lightThemeData = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.grey,
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  );

  static ThemeData _darkThemeData = ThemeData(
    primaryColor: Color(0xFF1E1F28),
    scaffoldBackgroundColor: Color(0xFF26242e),
    textTheme: TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    backgroundColor: Color(0xFF26242e),
  );

  ThemeData getAppThemedata(BuildContext context, bool isDarkModeEnabled) =>
      isDarkModeEnabled ? _darkThemeData : _lightThemeData;

  Color getToggleBackgroundColor(
          BuildContext context, bool isDarkModeEnabled) =>
      isDarkModeEnabled ? Color(0xFF222029) : Color(0xFFe7e7e8);
  Color getToggleButtonColor(BuildContext context, bool isDarkModeEnabled) =>
      isDarkModeEnabled ? Color(0xFf34323d) : Color(0xFFFFFFFF);
  List<BoxShadow> getShadow(BuildContext context, bool isDarkModeEnabled) => [
        if (!isDarkModeEnabled)
          BoxShadow(
              color: Color(0xFFd8d7da),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5)),
        if (isDarkModeEnabled)
          BoxShadow(
              color: Color(0x66000000),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5))
      ];
  Color getContainerColor(BuildContext context, bool isDarkModeEnabled) =>
      isDarkModeEnabled ? Colors.grey : Colors.white;
  Color getImageIconColor(BuildContext context, bool isDarkModeEnabled) =>
      !isDarkModeEnabled ? Colors.black : Colors.white;
}

class AppThemeNotifier extends StateNotifier<bool> {
  AppThemeNotifier(this.defaultDarkModeValue) : super(defaultDarkModeValue);

  final bool defaultDarkModeValue;

  toggleAppTheme(BuildContext context, WidgetRef ref) {
    final _isDarkModeEnabled =
        ref.read(sharedPreferencesProvider).getBool('isDarkModeEnabled');
    final _toggleValue = !(_isDarkModeEnabled ?? false);

    ref
        .read(sharedPreferencesProvider)
        .setBool('isDarkModeEnabled', _toggleValue)
        .whenComplete(
          () => {
            state = _toggleValue,
          },
        );
  }
}
