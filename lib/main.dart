import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'dart:ui';
import 'package:flutter/material.dart';

import 'config/router/router_provider.dart';
import 'observer/logger.dart';
import 'screens/providers/theme/theme_brightness_provider.dart';
import 'screens/providers/theme/theme_color_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      observers: [Logger()],
      child: const Yummy(),
    ),
  );
}

/// Allows the ability to scroll by dragging with touch, mouse, and trackpad.
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad
      };
}

class Yummy extends ConsumerWidget {
  const Yummy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeColor = ref.watch(themeColorProvider);
    final themeBrightness = ref.watch(themeBrightnessProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData(
        colorSchemeSeed: themeColor,
        brightness: themeBrightness,
      ),
    );
  }
}
