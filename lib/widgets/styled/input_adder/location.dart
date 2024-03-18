import 'package:Organiser/utils/theme/light.dart';
import 'package:Organiser/services/theme_provider.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LocationAdder extends StatelessWidget {
  
  final Map<String, String> locationController;


  LocationAdder({required this.locationController});

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 0,
        margin: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ImageFiltered(
                imageFilter: ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Image.asset( Provider.of<ThemeProvider>(context).themeData == lightMode?
                  'assets/map.jpg' : 'assets/map_dark.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 30,
                    ),
                    SizedBox(height: 5),
                    Column(
                      children: [
                        Text(
                          'Select Location',
                          style: TextStyle(
                              fontSize: 18,
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'More description about the specific location',
                          style: TextStyle(
                              fontSize: 13,
                              color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
