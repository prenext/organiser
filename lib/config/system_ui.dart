import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

SystemUiOverlayStyle getSystemUiOverlayStyle(ThemeData themeData) {
  Brightness statusBarIconBrightness =
      themeData.brightness == Brightness.dark ? Brightness.light : Brightness.dark;

  return SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: statusBarIconBrightness,
    systemNavigationBarColor: themeData.scaffoldBackgroundColor,
    statusBarIconBrightness: statusBarIconBrightness,
    statusBarBrightness: themeData.brightness,
    systemStatusBarContrastEnforced: false,
    systemNavigationBarDividerColor: themeData.scaffoldBackgroundColor,
  );
}
