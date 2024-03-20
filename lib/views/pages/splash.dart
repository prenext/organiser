import 'package:Organiser/views/widgets/common/auth/decorate.dart';
import 'package:flutter/material.dart';
import 'landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, required Null Function() onSelectThemeColor});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LandingPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthPageDecoration(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/logo.png',
                  width: 100,
                  height: 100,
                ),
                Text(
                  'Organizer',
                  style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Get everything in order!'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
