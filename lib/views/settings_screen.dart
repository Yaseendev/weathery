import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weathery/utils/providers.dart';
import 'package:weathery/widgets/language_toggle_button.dart';
import 'package:weathery/widgets/temper_toggle_button.dart';
import 'package:weathery/widgets/theme_toggle_button.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final _appThemeStateProvider = ref.read(appThemeStateProvider);
    final _appLocaleStateProvider = ref.read(appLocaleStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 8.0),
              child: Text(
                AppLocalizations.of(context)!.tempUnit,
                style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TemperToggleButton(
                  values: [
                    AppLocalizations.of(context)!.celsius,
                    AppLocalizations.of(context)!.fahrenheit,
                    AppLocalizations.of(context)!.kelvin
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8.0, bottom: 5.0),
              child: Text(
                AppLocalizations.of(context)!.appTheme,
                style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: ThemeToggleButton(
                values: [
                  AppLocalizations.of(context)!.light,
                  AppLocalizations.of(context)!.dark
                ],
                onToggleCallback: (v) {
                  _appThemeStateProvider.toggleAppTheme(context);
                },
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 8.0, bottom: 5.0),
              child: Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(fontSize: 80.sp, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 5),
            Center(
              child: LanguageToggleButton(
                values: ['English', 'العربية'],
                onToggleCallback: (v) {
                  _appLocaleStateProvider.toggleAppLocale(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
