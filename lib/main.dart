import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './views/home.dart';
import './utils/geolocation_handler.dart';
import 'utils/l10n/l10n.dart';
import 'utils/providers.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

Position currentPos;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  currentPos = await determinePosition();
  final sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.getBool('isDarkModeEnabled') ??
      sharedPreferences.setBool('isDarkModeEnabled', false);
  sharedPreferences.getBool('inEN') ?? sharedPreferences.setBool('inEN', true);
  runApp(ProviderScope(overrides: [
    currentLocationProvider.overrideWithValue(currentPos),
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ], child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _appThemeState = watch(appThemeStateProvider.state);
    final _appLocaleState = watch(appLocaleStateProvider.state);
    return MaterialApp(
      title: 'Weather App',
      theme: context
          .read(appThemeProvider)
          .getAppThemedata(context, _appThemeState),
      home: HomeScreen(currentLocation: currentPos),
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: context.read(appLocaleProvider).getAppLocale(context, _appLocaleState),
      debugShowCheckedModeBanner: false,
    );
  }
}