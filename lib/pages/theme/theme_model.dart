import 'package:flutter/material.dart';

class ColorThemeModel extends ChangeNotifier {
  Color _selectedColor = const Color.fromARGB(255, 68, 183, 58);

  Color get selectedColor => _selectedColor;

  void setSelectedColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }
}
