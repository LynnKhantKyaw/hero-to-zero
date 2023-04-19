import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero_to_zero/app.dart';
import 'package:hero_to_zero/db/db_names.dart';
import 'package:hero_to_zero/home.dart';
import 'package:hero_to_zero/shared/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(DBNames.authDb);

  final container = ProviderContainer();
  container.read(lightProvider);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  container.read(lightProvider.notifier).state = prefs.getBool(isDark) ?? true;

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
