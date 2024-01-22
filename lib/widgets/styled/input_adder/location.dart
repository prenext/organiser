import 'package:flutter/material.dart';
import 'dart:ui' as ui;

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
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        margin: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              ImageFiltered(
                imageFilter: ui.ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: Image.asset(
                  'assets/map.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 15),
                    Icon(
                      Icons.location_on,
                      color: Colors.red,
                      size: 50,
                    ),
                    SizedBox(height: 15),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 0,
                      color: Theme.of(context).cardColor.withOpacity(0.70),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5.0),
                        child: Column(
                          children: [
                            Text(
                              'Select Location',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              'More description about specific event location...',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                      ),
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
