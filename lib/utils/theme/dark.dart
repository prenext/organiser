import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.cyan.shade200,
      secondary: Colors.cyan.shade800,
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.cyan.shade800,
        foregroundColor: Colors.white,
        elevation: 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey.shade400.withOpacity(0.8),
        selectedItemColor: Colors.cyan.shade200,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        selectedIconTheme: IconThemeData(size: 25),
        unselectedIconTheme: IconThemeData(size: 20),
        backgroundColor: Colors.cyan.shade800),
    scaffoldBackgroundColor: Colors.grey.shade900,
    cardTheme: CardTheme(color: Colors.black12),
    shadowColor: Colors.black,
    drawerTheme: DrawerThemeData(backgroundColor: Colors.black87),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey.shade800.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    
);
