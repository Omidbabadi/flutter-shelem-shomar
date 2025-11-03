import 'package:flutter/material.dart';

class Cache {
  Cache._internal();

  static final Cache instance = Cache._internal();

    final themeModeNotifier = ValueNotifier<ThemeMode>(ThemeMode.system);

      void setThemeMode(ThemeMode theme) {
    themeModeNotifier.value = theme;
  }
}
