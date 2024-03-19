import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo or icon
                Image.asset(
                  'assets/gif/meal.png', // Replace with your app logo path
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                // Title
                Text(
                  'Goal and Meal Tracking',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 20),
                // Subtitle
                Text(
                  'Set Goals, Track Progress, and Monitor Meals',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 40),
                // Description
                Text(
                  'Easily set personal goals and track your progress. Log your meals and monitor your nutrition.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
