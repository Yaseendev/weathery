import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'l10n/l10n.dart';
import 'providers.dart';

class AppLocale {
  static Locale _enLocale = L10n.all[0];
  static Locale _arLocale = L10n.all[1];

  Locale getAppLocale(BuildContext context, bool isENSet) =>
      isENSet ? _enLocale : _arLocale;
}

class AppLocaleNotifier extends StateNotifier<bool> {
  AppLocaleNotifier(this.defaultAppLocale) : super(defaultAppLocale);

  final bool defaultAppLocale;

  toggleAppLocale(BuildContext context, WidgetRef ref) {
    final _isEnSet = ref.read(sharedPreferencesProvider).getBool('inEN');
    final _toggleValue = !(_isEnSet ?? false);

    ref
        .read(sharedPreferencesProvider)
        .setBool('inEN', _toggleValue)
        .whenComplete(
          () => {
            state = _toggleValue,
          },
        );
  }
}
