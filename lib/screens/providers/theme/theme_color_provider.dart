import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants.dart';

part 'theme_color_provider.g.dart';

@riverpod
class ThemeColor extends _$ThemeColor {
  @override
  Color build() {
    return ColorSelection.pink.color;
  }

  void changeColor(int value) {
    state = ColorSelection.values[value].color;
  }
}
