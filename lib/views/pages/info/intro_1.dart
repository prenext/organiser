import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
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
                  'assets/icon/logo.png', // Replace with your app logo path
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                // Title
                Text(
                  'Organizer App',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 20),
                // Subtitle
                Text(
                  'Your Personal Organizer',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 40),
                // Description
                Text(
                  'Organize your tasks, track your goals, and manage your meals with ease.',
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
