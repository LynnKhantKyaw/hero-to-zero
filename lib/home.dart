import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero_to_zero/shared/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: ref.watch(lightProvider),
            onChanged: (value) {
              _dartlight(value: value);
              // setState(() {});
            },
          ),
        ],
      ),
      body: const Column(),
    );
  }

  void _dartlight({required bool value}) async {
    ref.read(lightProvider.notifier).state = value;
    bool dark = ref.read(lightProvider);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDark, dark);
  }
}

final lightProvider = StateProvider<bool>((ref) {
  return false;
});
