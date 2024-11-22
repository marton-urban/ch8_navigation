import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_brightness_provider.g.dart';

@riverpod
class ThemeBrightness extends _$ThemeBrightness {
  @override
  Brightness build() {
    return Brightness.light;
  }

  void changeBrightness() {
    if (state == Brightness.light) {
      state = Brightness.dark;
    } else {
      state = Brightness.light;
    }
  }
}
