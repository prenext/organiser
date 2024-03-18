import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    primaryColor: Colors.cyan,
    cardTheme: CardTheme(color: Colors.white, elevation: 1),
    drawerTheme:
        DrawerThemeData(backgroundColor: Colors.cyan.shade50,),
    scaffoldBackgroundColor: Colors.grey.shade50,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade400,
      primary: Colors.cyan,
      secondary: Colors.cyan.shade50,
    ),
    appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.cyan.shade50,
        foregroundColor: Colors.black87,
        elevation: 1),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.cyan,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        selectedIconTheme: IconThemeData(size: 25),
        unselectedIconTheme: IconThemeData(size: 20),
        backgroundColor: Colors.cyan.shade50),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.cyan.shade50.withOpacity(0.95),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    shadowColor: Colors.grey.shade200,
    
    );
