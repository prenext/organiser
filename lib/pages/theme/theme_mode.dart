import 'package:flutter/material.dart';

class ThemeDialog extends StatelessWidget {
  final Function(String) onThemeSelected;

  ThemeDialog({required this.onThemeSelected});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Theme'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile(
            title: Text('Light'),
            value: 'light',
            groupValue: null, // You can set the current selected theme here
            onChanged: (value) {
              onThemeSelected(value as String);
              Navigator.pop(context);
            },
          ),
          RadioListTile(
            title: Text('Dark'),
            value: 'dark',
            groupValue: null, // You can set the current selected theme here
            onChanged: (value) {
              onThemeSelected(value as String);
              Navigator.pop(context);
            },
          ),
          RadioListTile(
            title: Text('System'),
            value: 'system',
            groupValue: null, // You can set the current selected theme here
            onChanged: (value) {
              onThemeSelected(value as String);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
