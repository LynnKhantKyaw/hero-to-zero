import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hero_to_zero/Theme/app_theme.dart';
import 'package:hero_to_zero/home.dart';
import 'package:hero_to_zero/routes/routes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDark = ref.watch(lightProvider)!;

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppTheme().darkThemeData : AppTheme().lightThemeData,
      routerConfig: ref.watch(goRouterProvider),
    );
  }
}
