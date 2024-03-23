import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  primaryColor: Colors.green,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.green.shade500,
    secondary: Colors.green.shade800,
  ),
  scaffoldBackgroundColor: Colors.grey.shade900,
  cardTheme: CardTheme(color: Colors.black12),
  shadowColor: Colors.black,
  drawerTheme: DrawerThemeData(backgroundColor: Colors.black87),
  dialogTheme: DialogTheme(
    backgroundColor: Colors.grey.shade500.withOpacity(0.9),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  ),
);
