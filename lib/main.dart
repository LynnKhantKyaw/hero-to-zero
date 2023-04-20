import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero_to_zero/app.dart';
import 'package:hero_to_zero/db/db_names.dart';
import 'package:hero_to_zero/home.dart';
import 'package:hero_to_zero/shared/utils.dart';
import 'package:hero_to_zero/src/auth/model/register/register_adaptor.dart';
import 'package:hero_to_zero/src/auth/model/register_model.dart';
import 'package:hero_to_zero/src/auth/presentation/login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  runZonedGuarded(() async {
    await Hive.initFlutter(document.path);
    Hive.registerAdapter(RegisterAdaptor());
    await Hive.openBox<RegisterModel>(DBNames.authDb);
  }, (error, stack) {
    print(error);
    print(stack);
  });
  // await Hive.initFlutter(document.path);
  // Hive.registerAdapter(RegisterAdaptor());
  // if (Hive.isBoxOpen(DBNames.authDb)) {
  //   print('not open');
  //   Hive.box<RegisterModel>(DBNames.authDb).close();
  // } else {
  //   print('open');
  // }
  // await Hive.openBox<RegisterModel>(DBNames.authDb);

  final container = ProviderContainer();
  container.read(lightProvider);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  container.read(lightProvider.notifier).state = prefs.getBool(isDark) ?? true;
  container.read(myTokenProvider.notifier).state =
      prefs.getBool(kToken) ?? false;
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}
