import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero_to_zero/app.dart';
import 'package:hero_to_zero/home.dart';
import 'package:hero_to_zero/objectbox.g.dart';
import 'package:hero_to_zero/shared/utils.dart';
import 'package:hero_to_zero/src/auth/presentation/login.dart';
import 'package:hero_to_zero/src/auth/service/store_register_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

late ObjectBox _objectBox;

late Store _store;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final document = await getApplicationDocumentsDirectory();
  _store = Store(getObjectBoxModel());
  await openStore();
  _objectBox = await ObjectBox.init();

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
