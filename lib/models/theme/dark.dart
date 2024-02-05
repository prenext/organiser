import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.black,
      primary: Colors.green.shade200,
      secondary: Colors.green.shade800,
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.green.shade800,
        foregroundColor: Colors.white,
        elevation: 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.grey.shade400.withOpacity(0.8),
        selectedItemColor: Colors.green.shade200,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(size: 20),
        backgroundColor: Colors.green.shade800),
    scaffoldBackgroundColor: Colors.grey.shade900,
    cardTheme: CardTheme(color: Colors.black12),
    shadowColor: Colors.black,
    drawerTheme: DrawerThemeData(backgroundColor: Colors.black54),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey.shade800.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    
);
