import 'package:Organiser/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: IconButton(
        icon: //dynamic icons for theme change
            Icon(Provider.of<ThemeProvider>(context).themeData.brightness ==
                    Brightness.light
                ? Icons.wb_sunny
                : Icons.nightlight_round),
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false)
              .toggleTheme(context);
        },
      ),
    );
  }
}
