import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/settings_provider.dart';
import '../neon/neon_toggle.dart';

class SettingsToggles extends ConsumerWidget {
  const SettingsToggles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Mode sombre', style: TextStyle(color: Colors.white)),
        NeonToggle(value: settings.isDarkMode, onChanged: (_) => ref.read(settingsProvider.notifier).toggleDarkMode()),
      ],
    );
  }
}
