import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../screens/providers/theme/theme_brightness_provider.dart';

class BrightnessButton extends ConsumerWidget {
  const BrightnessButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBright = ref.watch(themeBrightnessProvider) == Brightness.light;
    return IconButton(
      icon: isBright
          ? const Icon(Icons.dark_mode_outlined)
          : const Icon(Icons.light_mode_outlined),
      onPressed: ref.read(themeBrightnessProvider.notifier).changeBrightness,
    );
  }
}
