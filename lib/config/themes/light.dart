import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primaryColor: Colors.green,
  cardTheme: CardTheme(color: Colors.grey.shade200, elevation: 1),
  drawerTheme: DrawerThemeData(
    backgroundColor: Colors.green.shade50,
  ),
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade400,
    primary: Colors.green,
    secondary: Colors.green.shade50,
  ),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.green.shade50.withOpacity(0.95),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  ),
  shadowColor: Colors.grey.shade200,
);
