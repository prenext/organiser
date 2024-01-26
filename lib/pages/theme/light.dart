import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    cardTheme: CardTheme(color: Colors.white, elevation: 1),
    drawerTheme:
        DrawerThemeData(backgroundColor: Colors.green.shade50.withOpacity(0.9)),
    scaffoldBackgroundColor: Colors.grey.shade50,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade400,
      primary: Colors.green,
      secondary: Colors.green.shade50,
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.green.shade50,
        foregroundColor: Colors.black87,
        elevation: 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.green,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 8),
        selectedIconTheme: IconThemeData(size: 35),
        unselectedIconTheme: IconThemeData(size: 20),
        backgroundColor: Colors.green.shade50),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.green.shade50.withOpacity(0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    shadowColor: Colors.grey.shade200,
    
    );
