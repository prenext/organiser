import 'dart:ui';
import 'package:Organiser/views/widgets/common/theme_toggle.dart';
import 'package:flutter/material.dart';

class AuthPageDecoration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg_decorate.webp',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.55),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.85),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.96),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.97),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.98),
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.99),
                ],
              ),
            ),
          ),
        ),
        //button for toggling between light and dark mode
        Positioned(
          top: 40.0,
          left: 20.0,
          child: ThemeToggle(),
        ),
      ],
    );
  }
}
