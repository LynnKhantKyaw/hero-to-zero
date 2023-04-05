import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightThemeData = ThemeData(
    fontFamily: 'RobotoSlab',
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: Colors.amber,
    primaryColor: Colors.blue,
  );
  ThemeData darkThemeData = ThemeData(
    fontFamily: 'RobotoSlab',
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: Colors.amber,
    primaryColor: Colors.blue,
  );
}
